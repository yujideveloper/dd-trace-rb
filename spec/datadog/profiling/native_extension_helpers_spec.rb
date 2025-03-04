# typed: ignore

require 'ext/ddtrace_profiling_native_extension/native_extension_helpers'

require 'datadog/profiling/spec_helper'

RSpec.describe Datadog::Profiling::NativeExtensionHelpers do
  describe '.libdatadog_folder_relative_to_native_lib_folder' do
    context 'when libdatadog is available' do
      before do
        skip_if_profiling_not_supported(self)
        if PlatformHelpers.mac? && Libdatadog.pkgconfig_folder.nil? && ENV['LIBDATADOG_VENDOR_OVERRIDE'].nil?
          raise 'You have a libdatadog setup without macOS support. Did you forget to set LIBDATADOG_VENDOR_OVERRIDE?'
        end
      end

      it 'returns a relative path to libdatadog folder from the gem lib folder' do
        relative_path = described_class.libdatadog_folder_relative_to_native_lib_folder

        # RbConfig::CONFIG['SOEXT'] was only introduced in Ruby 2.5, so we have a fallback for older Rubies...
        libdatadog_extension =
          RbConfig::CONFIG['SOEXT'] ||
          ('so' if PlatformHelpers.linux?) ||
          ('dylib' if PlatformHelpers.mac?) ||
          raise('Missing SOEXT for current platform')

        gem_lib_folder = "#{Gem.loaded_specs['ddtrace'].gem_dir}/lib"
        full_libdatadog_path = "#{gem_lib_folder}/#{relative_path}/libdatadog_profiling.#{libdatadog_extension}"

        expect(relative_path).to start_with('../')
        expect(File.exist?(full_libdatadog_path))
          .to be(true), "Libdatadog not available in expected path: #{full_libdatadog_path.inspect}"
      end
    end

    context 'when libdatadog is unsupported' do
      it do
        expect(described_class.libdatadog_folder_relative_to_native_lib_folder(libdatadog_pkgconfig_folder: nil)).to be nil
      end
    end
  end
end

RSpec.describe Datadog::Profiling::NativeExtensionHelpers::Supported do
  describe '.supported?' do
    subject(:supported?) { described_class.supported? }

    context 'when there is an unsupported_reason' do
      before { allow(described_class).to receive(:unsupported_reason).and_return('Unsupported, sorry :(') }

      it { is_expected.to be false }
    end

    context 'when there is no unsupported_reason' do
      before { allow(described_class).to receive(:unsupported_reason).and_return(nil) }

      it { is_expected.to be true }
    end
  end

  describe '.unsupported_reason' do
    subject(:unsupported_reason) do
      reason = described_class.unsupported_reason
      reason.fetch(:reason).join("\n") if reason
    end

    before do
      allow(RbConfig::CONFIG).to receive(:[]).and_call_original
    end

    context 'when disabled via the DD_PROFILING_NO_EXTENSION environment variable' do
      around { |example| ClimateControl.modify('DD_PROFILING_NO_EXTENSION' => 'true') { example.run } }

      it { is_expected.to include 'DD_PROFILING_NO_EXTENSION' }
    end

    context 'when JRuby is used' do
      before { stub_const('RUBY_ENGINE', 'jruby') }

      it { is_expected.to include 'JRuby' }
    end

    context 'when TruffleRuby is used' do
      before { stub_const('RUBY_ENGINE', 'truffleruby') }

      it { is_expected.to include 'TruffleRuby' }
    end

    context 'when not on JRuby or TruffleRuby' do
      before { stub_const('RUBY_ENGINE', 'ruby') }

      context 'when on Windows' do
        before { expect(Gem).to receive(:win_platform?).and_return(true) }

        it { is_expected.to include 'Windows' }
      end

      context 'when on macOS' do
        around { |example| ClimateControl.modify('DD_PROFILING_MACOS_TESTING' => nil) { example.run } }

        before { stub_const('RUBY_PLATFORM', 'x86_64-darwin19') }

        it { is_expected.to include 'macOS' }
      end

      context 'when not on Linux' do
        before { stub_const('RUBY_PLATFORM', 'sparc-opensolaris') }

        it { is_expected.to include 'operating system is not supported' }
      end

      context 'when on Linux or on macOS with testing override enabled' do
        before { expect(Gem).to receive(:win_platform?).and_return(false) }

        context 'when not on amd64 or arm64' do
          before { stub_const('RUBY_PLATFORM', 'mipsel-linux') }

          it { is_expected.to include 'architecture is not supported' }
        end

        shared_examples 'supported ruby validation' do
          context 'when not on Ruby 2.1' do
            before { stub_const('RUBY_VERSION', '2.2.0') }

            shared_examples 'libdatadog usable' do
              context 'when libdatadog DOES NOT HAVE binaries for the current platform' do
                before do
                  expect(Libdatadog).to receive(:pkgconfig_folder).and_return(nil)
                  expect(Libdatadog).to receive(:available_binaries).and_return(%w[fooarch-linux bararch-linux-musl])
                end

                it { is_expected.to include 'platform variant' }
              end

              context 'when libdatadog HAS BINARIES for the current platform' do
                before { expect(Libdatadog).to receive(:pkgconfig_folder).and_return('/simulated/pkgconfig_folder') }

                it('marks the native extension as supported') { is_expected.to be nil }
              end
            end

            context 'on a Ruby version where we CAN NOT use the MJIT header' do
              before { stub_const('Datadog::Profiling::NativeExtensionHelpers::CAN_USE_MJIT_HEADER', false) }

              include_examples 'libdatadog usable'
            end

            context 'on a Ruby version where we CAN use the MJIT header' do
              before { stub_const('Datadog::Profiling::NativeExtensionHelpers::CAN_USE_MJIT_HEADER', true) }

              context 'but DOES NOT have MJIT support' do
                before { expect(RbConfig::CONFIG).to receive(:[]).with('MJIT_SUPPORT').and_return('no') }

                it { is_expected.to include 'without JIT' }
              end

              context 'and DOES have MJIT support' do
                before { expect(RbConfig::CONFIG).to receive(:[]).with('MJIT_SUPPORT').and_return('yes') }

                include_examples 'libdatadog usable'
              end
            end
          end

          context 'when on Ruby 2.1' do
            before { stub_const('RUBY_VERSION', '2.1.10') }

            it { is_expected.to include 'profiler only supports Ruby 2.2 or newer' }
          end
        end

        context 'when on amd64 (x86-64) linux' do
          before { stub_const('RUBY_PLATFORM', 'x86_64-linux') }

          include_examples 'supported ruby validation'
        end

        context 'when on arm64 (aarch64) linux' do
          before { stub_const('RUBY_PLATFORM', 'aarch64-linux') }

          include_examples 'supported ruby validation'
        end

        context 'when macOS testing override is enabled' do
          around { |example| ClimateControl.modify('DD_PROFILING_MACOS_TESTING' => 'true') { example.run } }

          before { stub_const('RUBY_PLATFORM', 'x86_64-darwin19') }

          include_examples 'supported ruby validation'
        end
      end
    end
  end

  describe '.pkg_config_missing?' do
    subject(:pkg_config_missing) { described_class.pkg_config_missing?(command: command) }

    before do
      skip_if_profiling_not_supported(self)
    end

    context 'when command is not available' do
      let(:command) { nil }

      it { is_expected.to be true }
    end

    # This spec is semi-realistic, because it actually calls into the pkg-config external process.
    #
    # We know pkg-config must be available on the machine running the tests because otherwise profiling would not be
    # supported (and thus `skip_if_profiling_not_supported` would've been triggered).
    #
    # We could also mock the entire interaction, but this seemed like a simple enough way to go.
    context 'when command is available' do
      before do
        # This helper is designed to be called from extconf.rb, which requires mkmf, which defines xsystem.
        # When executed in RSpec, mkmf is not required, so we replace it with the regular system call.
        without_partial_double_verification do
          expect(described_class).to receive(:xsystem) { |*args| system(*args) }
        end
      end

      context 'and pkg-config can successfully be called' do
        let(:command) { 'pkg-config' }

        it { is_expected.to be false }
      end

      context 'and pkg-config cannot be called' do
        let(:command) { 'does-not-exist' }

        it { is_expected.to be true }
      end
    end
  end
end
