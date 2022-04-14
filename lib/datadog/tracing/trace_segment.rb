# typed: true

require 'datadog/core/runtime/ext'

require 'datadog/tracing/sampling/ext'
require 'datadog/tracing/metadata/ext'
require 'datadog/tracing/metadata/tagging'

module Datadog
  module Tracing
    # Serializable construct representing a trace
    # @public_api
    # rubocop:disable Metrics/ClassLength
    class TraceSegment
      TAG_NAME = 'name'.freeze
      TAG_RESOURCE = 'resource'.freeze
      TAG_SERVICE = 'service'.freeze

      attr_reader \
        :id,
        :spans

      if RUBY_VERSION < '2.2' # nil.dup only fails in Ruby 2.1
        # Ensures #initialize can call nil.dup safely
        module RefineNil
          refine NilClass do
            def dup
              self
            end
          end
        end

        using RefineNil
      end

      def initialize(
        spans,
        agent_sample_rate: nil,
        hostname: nil,
        id: nil,
        lang: nil,
        name: nil,
        origin: nil,
        process_id: nil,
        rate_limiter_rate: nil,
        resource: nil,
        root_span_id: nil,
        rule_sample_rate: nil,
        runtime_id: nil,
        sample_rate: nil,
        sampling_priority: nil,
        service: nil,
        tags: nil,
        metrics: nil
      )
        @id = id
        @root_span_id = root_span_id
        @spans = spans || []

        # Does not make an effort to move metrics out of tags
        # The caller is expected to have done that
        @meta = tags || {}
        @metrics = metrics || {}

        # Set well-known tags, defaulting to getting the values from tags
        self.agent_sample_rate = agent_sample_rate || self.agent_sample_rate
        self.hostname = hostname || self.hostname
        self.lang = lang || self.lang
        self.name = (name || self.name).tap { |v| break (v.frozen? ? v : v.dup) }
        self.origin = (origin || self.origin).tap { |v| break (v.frozen? ? v : v.dup) }
        self.process_id = process_id || self.process_id
        self.rate_limiter_rate = rate_limiter_rate || self.rate_limiter_rate
        self.resource = (resource || self.resource).tap { |v| break (v.frozen? ? v : v.dup) }
        self.rule_sample_rate = rule_sample_rate || self.rule_sample_rate
        self.runtime_id = runtime_id || self.runtime_id
        self.sample_rate = sample_rate || self.sample_rate
        self.sampling_priority = sampling_priority || self.sampling_priority
        self.service = (service || self.service).tap { |v| break (v.frozen? ? v : v.dup) }
      end

      def any?
        @spans.any?
      end

      def count
        @spans.count
      end

      def empty?
        @spans.empty?
      end

      def length
        @spans.length
      end

      def size
        @spans.size
      end

      def agent_sample_rate
        metrics[Metadata::Ext::Sampling::TAG_AGENT_RATE]
      end

      def agent_sample_rate=(value)
        if value.nil?
          metrics.delete(Metadata::Ext::Sampling::TAG_AGENT_RATE)
          return
        end

        metrics[Metadata::Ext::Sampling::TAG_AGENT_RATE] = value
      end

      def hostname
        meta[Metadata::Ext::NET::TAG_HOSTNAME]
      end

      def hostname=(value)
        if value.nil?
          meta.delete(Metadata::Ext::NET::TAG_HOSTNAME)
          return
        end

        meta[Metadata::Ext::NET::TAG_HOSTNAME] = value
      end

      def lang
        meta[Core::Runtime::Ext::TAG_LANG]
      end

      def lang=(value)
        if value.nil?
          meta.delete(Core::Runtime::Ext::TAG_LANG)
          return
        end

        meta[Core::Runtime::Ext::TAG_LANG] = value
      end

      def name
        meta[TAG_NAME]
      end

      def name=(value)
        if value.nil?
          meta.delete(TAG_NAME)
          return
        end

        meta[TAG_NAME] = value
      end

      def origin
        meta[Metadata::Ext::Distributed::TAG_ORIGIN]
      end

      def origin=(value)
        if value.nil?
          meta.delete(Metadata::Ext::Distributed::TAG_ORIGIN)
          return
        end

        meta[Metadata::Ext::Distributed::TAG_ORIGIN] = value
      end

      def process_id
        meta[Core::Runtime::Ext::TAG_PID]
      end

      def process_id=(value)
        if value.nil?
          meta.delete(Core::Runtime::Ext::TAG_PID)
          return
        end

        meta[Core::Runtime::Ext::TAG_PID] = value
      end

      def rate_limiter_rate
        metrics[Metadata::Ext::Sampling::TAG_RATE_LIMITER_RATE]
      end

      def rate_limiter_rate=(value)
        if value.nil?
          metrics.delete(Metadata::Ext::Sampling::TAG_RATE_LIMITER_RATE)
          return
        end

        metrics[Metadata::Ext::Sampling::TAG_RATE_LIMITER_RATE] = value
      end

      def resource
        meta[TAG_RESOURCE]
      end

      def resource=(value)
        if value.nil?
          meta.delete(TAG_RESOURCE)
          return
        end

        meta[TAG_RESOURCE] = value
      end

      def rule_sample_rate
        metrics[Metadata::Ext::Sampling::TAG_RULE_SAMPLE_RATE]
      end

      def rule_sample_rate=(value)
        if value.nil?
          metrics.delete(Metadata::Ext::Sampling::TAG_RULE_SAMPLE_RATE)
          return
        end

        metrics[Metadata::Ext::Sampling::TAG_RULE_SAMPLE_RATE] = value
      end

      def runtime_id
        meta[Core::Runtime::Ext::TAG_ID]
      end

      def runtime_id=(value)
        if value.nil?
          meta.delete(Core::Runtime::Ext::TAG_ID)
          return
        end

        meta[Core::Runtime::Ext::TAG_ID] = value
      end

      def sample_rate
        metrics[Metadata::Ext::Sampling::TAG_SAMPLE_RATE]
      end

      def sample_rate=(value)
        if value.nil?
          metrics.delete(Metadata::Ext::Sampling::TAG_SAMPLE_RATE)
          return
        end

        metrics[Metadata::Ext::Sampling::TAG_SAMPLE_RATE] = value
      end

      def sampling_priority
        meta[Metadata::Ext::Distributed::TAG_SAMPLING_PRIORITY]
      end

      def sampling_priority=(value)
        if value.nil?
          meta.delete(Metadata::Ext::Distributed::TAG_SAMPLING_PRIORITY)
          return
        end

        meta[Metadata::Ext::Distributed::TAG_SAMPLING_PRIORITY] = value
      end

      def service
        meta[TAG_SERVICE]
      end

      def service=(value)
        if value.nil?
          meta.delete(TAG_SERVICE)
          return
        end

        meta[TAG_SERVICE] = value
      end

      # If an active trace is present, forces it to be retained by the Datadog backend.
      #
      # Any sampling logic will not be able to change this decision.
      #
      # @return [void]
      def keep!
        self.sampling_priority = Sampling::Ext::Priority::USER_KEEP
      end

      # If an active trace is present, forces it to be dropped and not stored by the Datadog backend.
      #
      # Any sampling logic will not be able to change this decision.
      #
      # @return [void]
      def reject!
        self.sampling_priority = Sampling::Ext::Priority::USER_REJECT
      end

      def sampled?
        sampling_priority == Sampling::Ext::Priority::AUTO_KEEP \
          || sampling_priority == Sampling::Ext::Priority::USER_KEEP
      end

      protected

      attr_reader \
        :root_span_id,
        :meta,
        :metrics
    end
    # rubocop:enable Metrics/ClassLength
  end
end
