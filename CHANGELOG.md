# Changelog

## [Unreleased]

## [1.5.0] - 2022-09-29

### Deprecation notice

* `c.tracing.instrument :rack, { quantize: { base: ... } }` will change its default from `:exclude` to `:show` in a future version. Voluntarily moving to `:show` is recommended.
* `c.tracing.instrument :rack, { quantize: { query: { show: ... } }` will change its default to `:all` in a future version, together with `quantize.query.obfuscate` changing to `:internal`. Voluntarily moving to these future values is recommended.

### Added

* Feature: Single Span Sampling ([#2128][])
* Add query string automatic redaction ([#2283][])
* Use full URL in `http.url` tag ([#2265][])
* Add `http.useragent` tag ([#2252][])
* Add `http.client_ip` tag for Rack-based frameworks ([#2248][])
* Ci-app: CI: Fetch committer and author in Bitrise ([#2258][])

### Changed

* Bump allowed version of debase-ruby_core_source to include v0.10.17 ([#2267][])

### Fixed

* Bug: Fix `service_nam` typo to `service_name` ([#2296][])
* Bug: Check AppSec Rails for railties instead of rails meta gem ([#2293][]) ([@seuros][])
* Ci-app: Correctly extract commit message from AppVeyor ([#2257][])

## [1.4.2] - 2022-09-27

### Fixed

OpenTracing context propagation ([#2191][], [#2289][])

## [1.4.1] - 2022-09-15

### Fixed

* Missing distributed traces when trace is dropped by priority sampling ([#2101][], [#2279][])
* Profiling support when Ruby is compiled without a shared library ([#2250][])

## [1.4.0] - 2022-08-25

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v1.4.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v1.3.0...v1.4.0

### Added

* gRPC: tag `grpc.client.deadline` ([#2200][])
* Implement telemetry, disable by default ([#2153][])

### Changed

* Bump `libdatadog` dependency version ([#2229][])

### Fixed

* Fix CI instrumentation configuration ([#2219][])

## [1.3.0] - 2022-08-04

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v1.3.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v1.2.0...v1.3.0

### Added

* Top-level span being tagged to avoid duplicate computation ([#2138][])

### Changed

* ActiveSupport: Optionally disable tracing with Rails ([@marcotc][])
* Rack: Resource overwritten by nested application ([#2180][])
* Rake: Explicit task instrumentation to prevent memory bloat ([#2174][])
* Sidekiq and DelayedJob: Add spans to improve tracing ([#2170][])
* Drop Profiling support for Ruby 2.1 ([#2140][])
* Migrate `libddprof` dependency to `libdatadog` ([#2061][])

### Fixed

* Fix OpenTracing propagation with TraceDigest ([#2201][])
* Fix SpanFilter dropping descendant spans ([#2074][])
* Redis: Fix Empty pipelined span being dropped ([#757][]) ([@sponomarev][])
* Fix profiler not restarting on `Process.daemon` ([#2150][])
* Fix setting service from Rails configuration ([#2118][]) ([@agrobbin][])
* Some document and development improvement ([@marocchino][]) ([@yukimurasawa][])

## [1.2.0] - 2022-07-11

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v1.2.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v1.1.0...v1.2.0

Special thanks go to [@miketheman][] for gifting Datadog access to the `datadog` gem a few days ago.

### Added

* Add Postgres (`pg` gem) instrumentation ([#2054][]) ([@jennchenn][])
* Add env var for debugging profiling native extension compilation issues ([#2069][])
* Teach Rest Client integration the `:split_by_domain` option ([#2079][]) ([@agrobbin][])
* Allow passing request_queuing option to Rack through Rails tracer ([#2082][]) ([@KieranP][])
* Add Utility to Collect Platform Information ([#2097][]) ([@jennchenn][])
* Add convenient interface for getting and setting tags using `[]` and `[]=` respectively ([#2076][]) ([@ioquatix][])
* Add b3 metadata in grpc ([#2110][]) ([@henrich-m][])

### Changed

* Profiler now reports profiling data using the libddprof gem ([#2059][])
* Rename `Kernel#at_fork_blocks` monkey patch to `Kernel#ddtrace_at_fork_blocks` ([#2070][])
* Improved error message for enabling profiling when `pkg-config` system tool is not installed ([#2134][])

### Fixed

* Prevent errors in `action_controller` integration when tracing is disabled ([#2027][]) ([@ahorner][])
* Fix profiler not building on ruby-head (3.2) due to VM refactoring ([#2066][])
* Span and trace IDs should not be zero ([#2113][]) ([@albertvaka][])
* Fix object_id usage as thread local key ([#2096][])
* Fix profiling not working on Heroku and AWS Elastic Beanstalk due to linking issues ([#2125][])

## [1.1.0] - 2022-05-25

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v1.1.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v1.0.0...v1.1.0

### Added

* [Application Security Monitoring](https://docs.datadoghq.com/security_platform/application_security/)
* Elasticsearch: v8.0 support ([#1985][])
* Sidekiq: Quantize args ([#1972][]) ([@dudo][])
* Profiling: Add libddprof dependency to power the new Ruby profiler ([#2028][])
* Helper to easily enable core dumps ([#2010][])

### Changed

* Support spaces in environment variable DD_TAGS ([#2011][])

### Fixed

* Fix "circular require considered harmful" warnings ([#1998][])
* Logging: Change ddsource to a scalar value ([#2022][])
* Improve exception logging ([#1992][])

## [1.0.0] - 2022-04-28

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v1.0.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v1.0.0.beta2...v1.0.0

Diff since last stable release: https://github.com/DataDog/dd-trace-rb/compare/v0.54.2...v1.0.0

### Added

- GraphQL 2.0 support ([#1982][])

### Changed

- AppSec: Update libddwaf to 1.3.0 ([#1981][])

### Fixed

- Rails log correlation ([#1989][]) ([@cwoodcox][])
- Resource not inherited from lazily annotated spans ([#1983][])
- AppSec: Query address for libddwaf ([#1990][])

### Refactored

- Docs: Add undocumented Rake option ([#1980][]) ([@ecdemis123][])
- Improvements to test suite & CI ([#1970][], [#1974][], [#1991][])
- Improvements to documentation ([#1984][])

## [1.0.0.beta2] - 2022-04-14

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v1.0.0.beta2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v1.0.0.beta1...v1.0.0.beta2

### Added

- Ruby 3.1 & 3.2 support ([#1975][], [#1955][])
- Trace tag API ([#1959][])

### Changed

- Access to configuration settings is namespaced ([#1922][])
- AWS provides metrics by default ([#1976][]) ([@dudo][])
- Update `debase-ruby_core_source` version ([#1964][])
- Profiling: Hide symbols/functions in native extension ([#1968][])
- Profiling: Renamed code_provenance.json to code-provenance.json ([#1919][])
- AppSec: Update libddwaf to v1.2.1 ([#1942][])
- AppSec: Update rulesets to v1.3.1 ([#1965][], [#1961][], [#1937][])
- AppSec: Avoid exception on missing ruleset file ([#1948][])
- AppSec: Env var consistency ([#1938][])

### Fixed

- Rake instrumenting while disabled ([#1940][], [#1945][])
- Grape instrumenting while disabled ([#1940][], [#1943][])
- CI: require 'datadog/ci' not loading dependencies ([#1911][])
- CI: RSpec shared example file names ([#1816][]) ([@Drowze][])
- General documentation improvements ([#1958][], [#1933][], [#1927][])
- Documentation fixes & improvements to 1.0 upgrade guide ([#1956][], [#1973][], [#1939][], [#1914][])

### Removed

- OpenTelemetry extensions (Use [OTLP](https://docs.datadoghq.com/tracing/setup_overview/open_standards/#otlp-ingest-in-datadog-agent) instead) ([#1917][])

### Refactored

- Agent settings resolver logic ([#1930][], [#1931][], [#1932][])

## [1.0.0.beta1] - 2022-02-15

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v1.0.0.beta1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.54.2...v1.0.0.beta1

See https://github.com/DataDog/dd-trace-rb/blob/v1.0.0.beta1/docs/UpgradeGuide.md.

## [0.54.2] - 2022-01-18

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.54.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.54.1...v0.54.2

### Changed

- Bump `debase-ruby_core_source` dependency version; also allow older versions to be used ([#1798][], [#1829][])
- Profiler: Reduce impact of reporting data in multi-process applications ([#1807][])
- Profiler: Update API used to report data to backend ([#1820][])

### Fixed

- Gracefully handle installation on environments where Ruby JIT seems to be available but is actually broken ([#1801][])

## [0.54.1] - 2021-11-30

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.54.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.54.0...v0.54.1

### Fixed

- Skip building profiling native extension when Ruby has been compiled without JIT ([#1774][], [#1776][])

## [0.54.0] - 2021-11-17

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.54.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.53.0...v0.54.0

### Added

- MongoDB service name resolver when using multi cluster ([#1423][]) ([@skcc321][])
- Service name override for ActiveJob in Rails configuration ([#1703][], [#1770][]) ([@hatstand][])
- Profiler: Expose profile duration and start to the UI ([#1709][])
- Profiler: Gather CPU time without monkey patching Thread ([#1735][], [#1740][])
- Profiler: Link profiler samples to individual web requests ([#1688][])
- Profiler: Capture threads with empty backtrace ([#1719][])
- CI-App: Memoize environment tags to improve performance ([#1762][])
- CI-App: `test.framework_version` tag for rspec and cucumber ([#1713][])

### Changed

- Set minimum version of dogstatsd-ruby 5 series to 5.3 ([#1717][])
- Use USER_KEEP/USER_REJECT for RuleSampler decisions ([#1769][])

### Fixed

- "private method `ruby2_keywords' called" errors ([#1712][], [#1714][])
- Configuration warning when Agent port is a String ([#1720][])
- Ensure internal trace buffer respects its maximum size ([#1715][])
- Remove erroneous maximum resque version support ([#1761][])
- CI-App: Environment variables parsing precedence ([#1745][], [#1763][])
- CI-App: GitHub Metadata Extraction ([#1771][])
- Profiler: Missing thread id for natively created threads ([#1718][])
- Docs: Active Job integration example code ([#1721][]) ([@y-yagi][])

### Refactored

- Redis client patch to use prepend ([#1743][]) ([@justinhoward][])

## [0.53.0] - 2021-10-06

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.53.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.52.0...v0.53.0

### Added

- ActiveJob integration ([#1639][]) ([@bensheldon][])
- Instrument Action Cable subscribe/unsubscribe hooks ([#1674][]) ([@agrobbin][])
- Instrument Sidekiq server internal events (heartbeat, job fetch, and scheduled push) ([#1685][]) ([@agrobbin][])
- Correlate Active Job logs to the active DataDog trace ([#1694][]) ([@agrobbin][])
- Runtime Metrics: Global VM cache statistics ([#1680][])
- Automatically send traces to agent Unix socket if present ([#1700][])
- CI-App: User Provided Git Metadata ([#1662][])
- ActionMailer integration ([#1280][])

### Changed

- Profiler: Set Sinatra resource setting at beginning of request and delay setting fallback resource ([#1628][])
- Profiler: Use most recent event for trace resource name ([#1695][])
- Profiler: Limit number of threads per sample ([#1699][])
- Profiler: Rename `extract_trace_resource` to `endpoint.collection.enabled` ([#1702][])

### Fixed

- Capture Rails exception before default error page is rendered ([#1684][])
- `NoMethodError` in sinatra integration when Tracer middleware is missing ([#1643][], [#1644][]) ([@mscrivo][])
- CI-App: Require `rspec-core` for RSpec integration ([#1654][]) ([@elliterate][])
- CI-App: Use the merge request branch on merge requests ([#1687][]) ([@carlallen][])
- Remove circular dependencies. ([#1668][]) ([@saturnflyer][])
- Links in the Table of Contents ([#1661][]) ([@chychkan][])
- CI-App: Fix CI Visibility Spec Tests ([#1706][])

### Refactored

- Profiler: pprof encoding benchmark and improvements ([#1511][])

## [0.52.0] - 2021-08-09

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.52.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.51.1...v0.52.0

### Added

- Add Sorbet typechecker to dd-trace-rb ([#1607][])

  Note that no inline type signatures were added, to avoid a hard dependency on sorbet.

- Profiler: Add support for annotating profiler stacks with the resource of the active web trace, if any ([#1623][])

  Note that this data is not yet visible on the profiling interface.

- Add error_handler option to GRPC tracer configuration ([#1583][]) ([@fteem][])
- User-friendly handling of slow submissions on shutdown ([#1601][])
- Profiler: Add experimental toggle to disable the profiling native extension ([#1594][])
- Profiler: Bootstrap profiling native extension ([#1584][])

### Changed

- Profiler: Profiling data is no longer reported when there's less than 1 second of data to report ([#1630][])
- Move Grape span resource setting to beginning of request ([#1629][])
- Set resource in Sinatra spans at the beginning of requests, and delay setting fallback resource to end of requests ([#1628][])
- Move Rails span resource setting to beginning of request ([#1626][])
- Make registry a global constant repository ([#1572][])
- Profiler: Remove automatic agentless support ([#1590][])

### Fixed

- Profiler: Fix CPU-time accounting in Profiling when fibers are used ([#1636][])
- Don't set peer.service tag on grpc.server spans ([#1632][])
- CI-App: Fix GitHub actions environment variable extraction ([#1622][])
- Additional Faraday 1.4+ cgroup parsing formats ([#1595][])
- Avoid shipping development cruft files in gem releases ([#1585][])

## [0.51.1] - 2021-07-13

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.51.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.51.0...v0.51.1

### Fixed

- AWS-SDK instrumentation without `aws-sdk-s3` ([#1592][])

## [0.51.0] - 2021-07-12

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.51.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.50.0...v0.51.0

### Added

- Semantic Logger trace correlation injection ([#1566][])
- New and improved Lograge trace correlation injection ([#1555][])
- Profiler: Start profiler on `ddtrace/auto_instrument`
- CI-App: Add runtime and OS information ([#1587][])
- CI-App: Read metadata from local git repository ([#1561][])

### Changed

- Rename `Datadog::Runtime` to `Datadog::Core::Environment` ([#1570][])

  As we prepare the `Datadog` Ruby namespace to better accommodate new products, we are moving a few internal modules to a different location to avoid conflicts.

  None of the affected files are exposed publicly in our documentation, and they are only expected to be used internally and may change at any time, even between patch releases.

  * The following modules have been moved:
  ```ruby
  Datadog::Runtime::Cgroup -> Datadog::Core::Environment::Cgroup
  Datadog::Runtime::ClassCount -> Datadog::Core::Environment::ClassCount
  Datadog::Runtime::Container -> Datadog::Core::Environment::Container
  Datadog::Runtime::GC -> Datadog::Core::Environment::GC
  Datadog::Runtime::Identity -> Datadog::Core::Environment::Identity
  Datadog::Runtime::ObjectSpace -> Datadog::Core::Environment::ObjectSpace
  Datadog::Runtime::Socket -> Datadog::Core::Environment::Socket
  Datadog::Runtime::ThreadCount -> Datadog::Core::Environment::ThreadCount
  ```
  * Most constants from `Datadog::Ext::Runtime` have been moved to a new module: `Datadog::Core::Environment::Ext`.
- Skip CPU time instrumentation if logging gem is detected ([#1557][])

### Fixed

- Initialize `dogstatsd-ruby` in single threaded mode ([#1576][])

  This should alleviate any existing issues with `dogstatsd-ruby` resource leaks.

- Do not use configured `dogstatsd-ruby` instance when it's an incompatible version ([#1560][])
- Ensure tags with special Datadog processing are consistently serialized ([#1556][])
- Profiler: NameError during initialization ([#1552][])

### Refactored
- Improvements to test suite & CI ([#1586][])
- Improvements to documentation ([#1397][])

## [0.50.0] - 2021-06-07

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.50.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.49.0...v0.50.0

### Added

- Add warning, update documentation, for incompatible dogstastd-ruby version ([#1544][][#1533][])
- Add CI mode and Test mode feature ([#1504][])
- Add Gem.loaded_specs fallback behavior if protobuf or dogstatsd-ruby already loaded([#1506][][#1510][])

### Changed

- Declare EOL for Ruby 2.0 support ([#1534][])
- Rename Thread#native_thread_id to #pthread_thread_id to avoid conflict with Ruby 3.1 ([#1537][])

### Fixed

- Fix tracer ignoring value for service tag (service.name) in DD_TAGS ([#1543][])
- Fix nested error reporting to correctly walk clause chain ([#1535][])
- Fix AWS integration to prevent S3 URL presigning from generating a remote request span ([#1494][])
- Fix backtrace handling of exception classes that return nil message ([#1500][]) ([@masato-hi][])

### Refactored

- Cleanup Ruby 2.0 Code (dropping Ruby 2.0 support) ([#1529][][#1523][][#1524][][#1509][][#1507][][#1503][][#1502][])

## [0.49.0] - 2021-05-12

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.49.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.48.0...v0.49.0

### Added

- Add cause to error stack trace ([#1472][])

### Changed

### Fixed

- Prevent double initialization when auto instrumenting non-Rails applications ([#1497][])
- Support kwargs in Ruby 3.0 for sucker_punch ([#1495][]) ([@lloeki][])
- Fargate fixes and Container parsing for CGroups ([#1487][][#1480][][#1475][])
- Fix ActionPack instrumentation `#starts_with?` error([#1489][])
- Doc fixes ([#1473][]) ([@kexoth][])

### Refactored

## [0.48.0] - 2021-04-19

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.48.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.47.0...v0.48.0

### Added

- Makara support with ActiveRecord ([#1447][])
- `tag_body` configuration for Shoryuken ([#1449][]) ([@gkampjes][])

### Changed

- Add deprecation warning for Ruby 2.0 support ([#1441][])

  Support for Ruby 2.0 will be available up to release `0.49.x`, and dropped from release `0.50.0` and greater.
  Users are welcome to continue using version `< 0.50.0` for their Ruby 2.0 deployments going forward.

- Auto instrument Resque workers by default ([#1400][])

### Fixed

- Ensure DD_TRACE_SAMPLE_RATE enables full RuleSampler ([#1416][])
- Fix Fargate 1.4 container ID not being read ([#1457][])
- Correctly close all StatsD clients ([#1429][])

### Refactored
- Improvements to test suite & CI ([#1421][], [#1435][], [#1445][], [#1453][], [#1456][], [#1461][])
- Improvements to documentation ([#1455][])

## [0.47.0] - 2021-03-29

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.47.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.46.0...v0.47.0

### Added

- Document support for httpx integration ([#1396][]) ([@HoneyryderChuck][])
- Schemas to list of supported AWS services ([#1415][]) ([@tomgi][])
- Branch test coverage report ([#1343][])

### Changed

- **BREAKING** Separate Resolver configuration and resolution steps ([#1319][])

  ### ActiveRecord `describes` configuration now supports partial matching

  Partial matching of connection fields (adapter, username, host, port, database) is now allowed. Previously, only an exact match of connections fields would be considered matching. This should help greatly simplify database configuration matching, as you will only need to provide enough fields to correctly separate your distinct database connections.

  If you have a `c.use active_record, describe:` statement in your application that is currently not matching any connections, you might start seeing them match after this release.

  `c.use active_record, describe:` statements that are currently matching a connection will continue to match that same connection.

  You can refer to the [expanded ActiveSupport documentation for details on how to use the new partial matchers and configuration code examples](https://github.com/DataDog/dd-trace-rb/blob/0794be4cd455caf32e7a9c8f79d80a4b77c4087a/docs/GettingStarted.md#active-record).

  ### `Datadog::Contrib::Configuration::Resolver` interface changed

  The interface for `Datadog::Contrib::Configuration::Resolver` has changed: custom configuration resolvers that inherit from ``Datadog::Contrib::Configuration::Resolver`` will need be changed to fulfill the new interface. See [code documentation for `Datadog::Contrib::Configuration::Resolver` for specific API requirements](https://github.com/DataDog/dd-trace-rb/blob/0794be4cd455caf32e7a9c8f79d80a4b77c4087a/lib/ddtrace/contrib/configuration/resolver.rb).


- Remove type check from ThreadLocalContext#local. ([#1399][]) ([@orekyuu][])

### Fixed

- Support for JRuby 9.2.0.0 ([#1409][])
- Failed integration message ([#1394][]) ([@e1senh0rn][])
- Addressed "warning: instance variable [@components][] not initialized" ([#1419][])
- Close /proc/self/cgroup file after reading ([#1414][])
- Improve internal "only once" behavior across the tracer ([#1398][])
- Increase thread-safety during tracer initialization ([#1418][])

### Refactored

- Use MINIMUM_VERSION in resque compatible? check ([#1426][]) ([@mriddle][])
- Lint fixes for Rubocop 1.12.0 release ([#1430][])
- Internal tracer improvements ([#1403][])
- Improvements to test suite & CI ([#1334][], [#1379][], [#1393][], [#1406][], [#1408][], [#1412][], [#1417][], [#1420][], [#1422][], [#1427][], [#1428][], [#1431][], [#1432][])

## [0.46.0] - 2021-03-03

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.46.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.45.0...v0.46.0

### Added

- Add EventBridge to supported AWS services ([#1368][]) ([@tomgi][])
- Add `time_now_provider` configuration option ([#1224][])
  - This new option allows the span `start_time` and `end_time` to be configured in environments that change the default time provider, like with *Timecop*. More information in the [official documentation](https://docs.datadoghq.com/tracing/setup_overview/setup/ruby/#tracer-settings).
- Add name to background threads created by ddtrace ([#1366][])

### Changed

- Rework RSpec instrumentation as separate traces for each test ([#1381][])

### Fixed

- ArgumentError: wrong number of arguments (given 2, expected 0) due to concurrent `require` ([#1306][], [#1354][]) ([@EvNomad][])
- Fix Rails' deprecation warnings ([#1352][])
- Fully populate Rake span fields on exceptions ([#1377][])
- Fix a typo in `httpclient` integration ([#1365][]) ([@y-yagi][])
- Add missing license files for vendor'd code ([#1346][])

### Refactored

- Improvements to test suite & CI ([#1277][], [#1305][], [#1336][], [#1350][], [#1353][], [#1357][], [#1367][], [#1369][], [#1370][], [#1371][], [#1374][], [#1380][])
- Improvements to documentation ([#1332][])

### Removed

- Remove deprecated Datadog::Monkey ([#1341][])
- Remove deprecated Datadog::DeprecatedPin ([#1342][])
- Remove unused Shim/MethodWrapper/MethodWrapping ([#1347][])
- Remove APP_ANALYTICS from tests instrumentation ([#1378][]) ([@AdrianLC][])

## [0.45.0] - 2021-01-26

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.45.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.44.0...v0.45.0

### Added

- Option to auto enable all instrumentations ([#1260][])
- httpclient support ([#1311][]) ([@agrobbin][])

### Changed

- Promote request_queuing out of experimental ([#1320][])
- Safeguards around distributed HTTP propagator ([#1304][])
- Improvements to test integrations ([#1291][], [#1303][], [#1307][])

### Refactored

- Direct object_id lookup for ActiveRecord connections ([#1317][])
- Avoid multiple parsing of Ethon URIs ([#1302][]) ([@callumj][])
- Improvements to test suite & CI ([#1309][], [#1318][], [#1321][], [#1323][], [#1325][], [#1331][])
- Improvements to documentation ([#1326][])

## [0.44.0] - 2021-01-06

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.44.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.43.0...v0.44.0

### Added

- Ruby 3.0 support ([#1281][], [#1296][], [#1298][])
- Rails 6.1 support ([#1295][])
- Qless integration ([#1237][]) ([@sco11morgan][])
- AWS Textract service to AWS integration ([#1270][]) ([@Sticksword][])
- Ability to disable Redis argument capture ([#1276][]) ([@callumj][])
- Upload coverage report to Codecov ([#1289][])

### Changed

- Reduce Runtime Metrics frequency to every 10 seconds ([#1269][])

### Fixed

- Disambiguate resource names for Grape endpoints with shared paths ([#1279][]) ([@pzaich][])
- Remove invalid Jenkins URL from CI integration ([#1283][])

### Refactored

- Reduce memory allocation when unnecessary ([#1273][], [#1275][]) ([@callumj][])
- Improvements to test suite & CI ([#847][], [#1256][], [#1257][], [#1266][], [#1272][], [#1277][], [#1278][], [#1284][], [#1286][], [#1287][], [#1293][], [#1299][])
- Improvements to documentation ([#1262][], [#1263][], [#1264][], [#1267][], [#1268][], [#1297][])

## [0.43.0] - 2020-11-18

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.43.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.42.0...v0.43.0

### Added

- Background job custom error handlers ([#1212][]) ([@norbertnytko][])
- Add "multi" methods instrumentation for Rails cache ([#1217][]) ([@michaelkl][])
- Support custom error status codes for Grape ([#1238][])
- Cucumber integration ([#1216][])
- RSpec integration ([#1234][])
- Validation to `:on_error` argument on `Datadog::Tracer#trace` ([#1220][])

### Changed

- Update `TokenBucket#effective_rate` calculation ([#1236][])

### Fixed

- Avoid writer reinitialization during shutdown ([#1235][], [#1248][])
- Fix configuration multiplexing ([#1204][], [#1227][])
- Fix misnamed B3 distributed headers ([#1226][], [#1229][])
- Correct span type for AWS SDK ([#1233][])
- Correct span type for internal Pin on HTTP clients ([#1239][])
- Reset trace context after fork ([#1225][])

### Refactored

- Improvements to test suite ([#1232][], [#1244][])
- Improvements to documentation ([#1243][], [#1218][]) ([@cjford][])

### Removed

## [0.42.0] - 2020-10-21

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.42.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.41.0...v0.42.0

### Added

- Increase Resque support to include 2.0  ([#1213][]) ([@erict-square][])

- Improve gRPC Propagator to support metadata array values ([#1203][]) ([@mdehoog][])

- Add CPU benchmarks, diagnostics to tests ([#1188][], [#1198][])

- Access active correlation by Thread ([#1200][])

- Improve delayed_job instrumentation ([#1187][]) ([@norbertnytko][])

### Changed

### Fixed

- Improve Rails `log_injection` option to support more Lograge formats ([#1210][]) ([@Supy][])

- Fix Changelog ([#1199][]) ([@y-yagi][])

### Refactored

- Refactor Trace buffer into multiple components ([#1195][])

## [0.41.0] - 2020-09-30

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.41.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.40.0...v0.41.0

### Added

- Improve duration counting using monotonic clock ([#424][], [#1173][]) ([@soulcutter][])

### Changed

- Add peer.service tag to external services and skip tagging external services with language tag for runtime metrics ([#934][], [#935][], [#1180][])
  - This helps support the way runtime metrics are associated with spans in the UI.
- Faster TraceBuffer for CRuby ([#1172][])
- Reduce memory usage during gem startup ([#1090][])
- Reduce memory usage of the HTTP transport ([#1165][])

### Fixed

- Improved prepared statement support for Sequel  integrations ([#1186][])
- Fix Sequel instrumentation when executing literal strings ([#1185][]) ([@matchbookmac][])
- Remove explicit `Logger` class verification ([#1181][]) ([@bartekbsh][])
  - This allows users to pass in a custom logger that does not inherit from `Logger` class.
- Correct tracer buffer metric counting ([#1182][])
- Fix Span#pretty_print for empty duration ([#1183][])

### Refactored

- Improvements to test suite & CI ([#1179][], [#1184][], [#1177][], [#1178][], [#1176][])
- Reduce generated Span ID range to fit in Fixnum ([#1189][])

## [0.40.0] - 2020-09-08

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.40.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.39.0...v0.40.0

### Added

- Rails `log_injection` option to auto enable log correlation ([#1157][])
- Que integration ([#1141][], [#1146][]) ([@hs-bguven][])
- `Components#startup!` hook ([#1151][])
- Code coverage report ([#1159][])
  - Every commit now has a `coverage` CI step that contains the code coverage report. This report can be found in the `Artifacts` tab of that CI step, under `coverage/index.html`.

### Changed

- Use a single top level span for Racecar consumers ([#1150][]) ([@dasch][])

### Fixed

- Sinatra nested modular applications possibly leaking spans ([#1035][], [#1145][])

  * **BREAKING** for nested modular Sinatra applications only:
    ```ruby
    class Nested < Sinatra::Base
    end

    class TopLevel < Sinatra::Base
      use Nested # Nesting happens here
    end
    ```
  * Non-breaking for classic applications nor modular non-nested applications.

  Fixes issues introduced by [#1015][] (in 0.35.0), when we first introduced Sinatra support for modular applications.

  The main issue we had to solve for modular support is how to handle nested applications, as only one application is actually responsible for handling the route. A naive implementation would cause the creation of nested `sinatra.request` spans, even for applications that did not handle the request. This is technically correct, as Sinatra is traversing that middleware, accruing overhead, but that does not aligned with our existing behavior of having a single `sinatra.request` span.

  While trying to achieve backwards-compatibility, we had to resort to a solution that turned out brittle: `sinatra.request` spans had to start in one middleware level and finished it in another. This allowed us to only capture the `sinatra.request` for the matching route, and skip the non-matching one. This caused unexpected issues on some user setups, specially around Sinatra middleware that created spans in between the initialization and closure of `sinatra.request` spans.

  This change now address these implementation issues by creating multiple `sinatra.request`, one for each traversed Sinatra application, even non-matching ones. This instrumentation is more correct, but at the cost of being a breaking change for nested modular applications.

  Please see [#1145][] for more information, and example screenshots on how traces for affected applications will look like.

- Rack/Rails span error propagation with `rescue_from` ([#1155][], [#1162][])
- Prevent logger recursion during startup ([#1158][])
- Race condition on new worker classes ([#1154][])
  - These classes represent future work, and not being used at the moment.

### Refactored

- Run CI tests in parallel ([#1156][])
- Migrate minitest tests to RSpec ([#1127][], [#1128][], [#1133][], [#1149][], [#1152][], [#1153][])
- Improvements to test suite ([#1134][], [#1148][], [#1163][])
- Improvements to documentation ([#1138][])

### Removed

- **Ruby 1.9 support ended, as it transitions from Maintenance to End-Of-Life ([#1137][])**
- GitLab status check when not applicable ([#1160][])
  - Allows for PRs pass all status checks once again. Before this change, a `dd-gitlab/copy_to_s3` check would never leave the "Pending" status. This check tracks the deployment of a commit to an internal testing platform, which currently only happens on `master` branch or when manually triggered internally.

## [0.39.0] - 2020-08-05

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.39.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.38.0...v0.39.0

### Added

- JRuby 9.2 support ([#1126][])
- Sneakers integration ([#1121][]) ([@janz93][])

### Changed

- Consistent environment variables across languages ([#1115][])
- Default logger level from WARN to INFO ([#1120][]) ([@gingerlime][])
  - This change also reduces the startup environment log message to INFO level ([#1104][])

### Fixed

- HTTP::StateError on error responses for http.rb ([#1116][], [#1122][]) ([@evan-waters][])
- Startup log error when using the test adapter ([#1125][], [#1131][]) ([@benhutton][])
- Warning message for Faraday < 1.0 ([#1129][]) ([@fledman][], [@tjwp][])
- Propagate Rails error message to Rack span ([#1124][])

### Refactored

- Improved ActiveRecord documentation ([#1119][])
- Improvements to test suite ([#1105][], [#1118][])

## [0.38.0] - 2020-07-13

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.38.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.37.0...v0.38.0

### Added

- http.rb integration ([#529][], [#853][])
- Kafka integration ([#1070][]) ([@tjwp][])
- Span#set_tags ([#1081][]) ([@DocX][])
- retry_count tag for Sidekiq jobs ([#1089][]) ([@elyalvarado][])
- Startup environment log ([#1104][], [#1109][])
- DD_SITE and DD_API_KEY configuration ([#1107][])

### Changed

- Auto instrument Faraday default connection ([#1057][])
- Sidekiq client middleware is now the same for client and server ([#1099][]) ([@drcapulet][])
- Single pass SpanFilter ([#1071][]) ([@tjwp][])

### Fixed

- Ensure fatal exceptions are propagated ([#1100][])
- Respect child_of: option in Tracer#trace ([#1082][]) ([@DocX][])
- Improve Writer thread safety ([#1091][]) ([@fledman][])

### Refactored

- Improvements to test suite ([#1092][], [#1103][])

## [0.37.0] - 2020-06-24

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.37.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.36.0...v0.37.0

### Refactored

- Documentation improvements regarding Datadog Agent defaults ([#1074][]) ([@cswatt][])
- Improvements to test suite ([#1043][], [#1051][], [#1062][], [#1075][], [#1076][], [#1086][])

### Removed

- **DEPRECATION**: Deprecate Contrib::Configuration::Settings#tracer= ([#1072][], [#1079][])
  - The `tracer:` option is no longer supported for integration configuration. A deprecation warning will be issued when this option is used.
  - Tracer instances are dynamically created when `ddtrace` is reconfigured (through `Datadog.configure{}` calls).

    A reference to a tracer instance cannot be stored as it will be replaced by a new instance during reconfiguration.

    Retrieving the global tracer instance, by invoking `Datadog.tracer`, is the only safe mechanism to acquire the active tracer instance.

    Allowing an integration to set its tracer instance is effectively preventing that integration from dynamically retrieving the current active tracer in the future, thus causing it to record spans in a stale tracer instance. Spans recorded in a stale tracer instance will look disconnected from their parent context.

- **BREAKING**: Remove Pin#tracer= and DeprecatedPin#tracer= ([#1073][])
  - The `Pin` and `DeprecatedPin` are internal tools used to provide more granular configuration for integrations.
  - The APIs being removed are not public nor have been externally documented. The `DeprecatedPin` specifically has been considered deprecated since 0.20.0.
  - This removal is a continuation of [#1079][] above, thus carrying the same rationale.

### Migration

- Remove `tracer` argument provided to integrations (e.g. `c.use :rails, tracer: ...`).
- Remove `tracer` argument provided to `Pin` or `DeprecatedPin` initializers (e.g. `Pin.new(service, tracer: ...)`).
- If you require a custom tracer instance, use a global instance configuration:
    ```ruby
    Datadog.configure do |c|
      c.tracer.instance = custom_tracer
    end
    ```

## [0.36.0] - 2020-05-27

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.36.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.35.2...v0.36.0

### Changed

- Prevent trace components from being re-initialized multiple times during setup ([#1037][])

### Fixed

- Allow Rails patching if Railties are loaded ([#993][], [#1054][]) ([@mustela][], [@bheemreddy181][], [@vramaiah][])
- Pin delegates to default tracer unless configured ([#1041][])

### Refactored

- Improvements to test suite ([#1027][], [#1031][], [#1045][], [#1046][], [#1047][])

## [0.35.2] - 2020-05-08

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.35.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.35.1...v0.35.2

### Fixed

- Internal tracer HTTP requests generating traces ([#1030][], [#1033][]) ([@gingerlime][])
- `Datadog.configure` forcing all options to eager load ([#1032][], [#1034][]) ([@kelvin-acosta][])

## [0.35.1] - 2020-05-05

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.35.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.35.0...v0.35.1

### Fixed

- Components#teardown! NoMethodError ([#1021][], [#1023][]) ([@bzf][])

## [0.35.0] - 2020-04-29

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.35.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.34.2...v0.35.0

### Added

- Chunk large trace payloads before flushing ([#818][], [#840][])
- Support for Sinatra modular apps ([#486][], [#913][], [#1015][]) ([@jpaulgs][], [@tomasv][], [@ZimbiX][])
- active_job support for Resque ([#991][]) ([@stefanahman][], [@psycholein][])
- JRuby 9.2 to CI test matrix ([#995][])
- `TraceWriter` and `AsyncTraceWriter` workers ([#986][])
- Runtime metrics worker ([#988][])

### Changed

- Populate env, service, and version from tags ([#1008][])
- Extract components from configuration ([#996][])
- Extract logger to components ([#997][])
- Extract runtime metrics worker from `Writer` ([#1004][])
- Improvements to Faraday documentation ([#1005][])

### Fixed

- Runtime metrics not starting after #write ([#1010][])

### Refactored

- Improvements to test suite ([#842][], [#1006][], [#1009][])

## [0.34.2] - 2020-04-09

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.34.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.34.1...v0.34.2

### Changed

- Revert Rails applications setting default `env` if none are configured. ([#1000][]) ([@errriclee][])

## [0.34.1] - 2020-04-02

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.34.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.34.0...v0.34.1

### Changed

- Rails applications set default `service` and `env` if none are configured. ([#990][])

### Fixed

- Some configuration settings not applying ([#989][], [#990][]) ([@rahul342][])

## [0.34.0] - 2020-03-31

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.34.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.33.1...v0.34.0

### Added

- `Datadog::Event` for simple pub-sub messaging ([#972][])
- `Datadog::Workers` for trace writing ([#969][], [#973][])
- `_dd.measured` tag to some integrations for more statistics ([#974][])
- `env`, `service`, `version`, `tags` configuration for auto-tagging ([#977][], [#980][], [#982][], [#983][], [#985][])
- Multiplexed configuration for Ethon, Excon, Faraday, HTTP integrations ([#882][], [#953][]) ([@stormsilver][])

### Fixed

- Runtime metrics configuration dropping with new writer ([#967][], [#968][]) ([@ericmustin][])
- Faraday "unexpected middleware" warnings on v0.x ([#965][], [#971][])
- Presto configuration ([#975][])
- Test suite issues ([#981][])

## [0.33.1] - 2020-03-09

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.33.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.33.0...v0.33.1

### Fixed

- NoMethodError when activating instrumentation for non-existent library ([#964][], [#966][]) ([@roccoblues][], [@brafales][])

## [0.33.0] - 2020-03-05

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.33.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.32.0...v0.33.0

### Added

- Instrumentation for [Presto](https://github.com/treasure-data/presto-client-ruby) ([#775][], [#920][], [#961][]) ([@ahammel][], [@ericmustin][])
- Sidekiq job argument tagging ([#933][]) ([@mantrala][])
- Support for multiple Redis services ([#861][], [#937][], [#940][]) ([@mberlanda][])
- Support for Sidekiq w/ Delayed extensions ([#798][], [#942][]) ([@joeyAghion][])
- Setter/reset behavior for configuration options ([#957][])
- Priority sampling rate tag ([#891][])

### Changed

- Enforced minimum version requirements for instrumentation ([#944][])
- RubyGems minimum version requirement 2.0.0 ([#954][]) ([@Joas1988][])
- Relaxed Rack minimum version to 1.1.0 ([#952][])

### Fixed

- AWS instrumentation patching when AWS is partially loaded ([#938][], [#945][]) ([@letiesperon][], [@illdelph][])
- NoMethodError for RuleSampler with priority sampling ([#949][], [#950][]) ([@BabyGroot][])
- Runtime metrics accumulating service names when disabled ([#956][])
- Sidekiq instrumentation incompatibility with Rails 6.0.2 ([#943][], [#947][]) ([@pj0tr][])
- Documentation tweaks ([#948][], [#955][]) ([@mstruve][], [@link04][])
- Various test suite issues ([#930][], [#932][], [#951][], [#960][])

## [0.32.0] - 2020-01-22

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.32.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.31.1...v0.32.0

### Added

- New transport: Datadog::Transport::IO ([#910][])
- Dual License ([#893][], [#921][])

### Changed

- Improved annotation of `net/http` spans during exception ([#888][], [#907][]) ([@djmb][], [@ericmustin][])
- RuleSampler is now the default sampler; no behavior changes by default ([#917][])

### Refactored

- Improved support for multiple tracer instances ([#919][])
- Improvements to test suite ([#909][], [#928][], [#929][])

## [0.31.1] - 2020-01-15

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.31.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.31.0...v0.31.1

### Fixed

- Implement SyncWriter#stop method ([#914][], [#915][]) ([@Yurokle][])
- Fix references to Datadog::Tracer.log ([#912][])
- Ensure http.status_code tag is always a string ([#927][])

### Refactored

- Improvements to test suite & CI ([#911][], [#918][])

## [0.31.0] - 2020-01-07

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.31.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.30.1...v0.31.0

### Added

- Ruby 2.7 support ([#805][], [#896][])
- ActionCable integration ([#132][], [#824][]) ([@renchap][], [@ericmustin][])
- Faraday 1.0 support ([#906][])
- Set resource for Rails template spans ([#855][], [#881][]) ([@djmb][])
- at_exit hook for graceful Tracer shutdown ([#884][])
- Environment variables to configure RuleSampler defaults ([#892][])

### Changed

- Updated partial trace flushing to conform with new back-end requirements ([#845][])
- Store numeric tags as metrics ([#886][])
- Moved logging from Datadog::Tracer to Datadog::Logger ([#880][])
- Changed default RuleSampler rate limit from unlimited to 100/s ([#898][])

### Fixed

- SyncWriter incompatibility with Transport::HTTP::Client ([#903][], [#904][]) ([@Yurokle][])

### Refactored

- Improvements to test suite & CI ([#815][], [#821][], [#841][], [#846][], [#883][], [#895][])

## [0.30.1] - 2019-12-30

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.30.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.30.0...v0.30.1

### Fixed

- NoMethodError when configuring tracer with SyncWriter ([#899][], [#900][]) ([@Yurokle][])
- Spans associated with runtime metrics when disabled ([#885][])

### Refactored

- Improvements to test suite & CI ([#815][], [#821][], [#846][], [#883][], [#890][], [#894][])

## [0.30.0] - 2019-12-04

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.30.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.29.1...v0.30.0

### Added

- Additional tracer health metrics ([#867][])
- Integration patching instrumentation ([#871][])
- Rule-based trace sampling ([#854][])

### Fixed

- Rails template layout name error ([#872][]) ([@djmb][])

## [0.29.1] - 2019-11-26

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.29.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.29.0...v0.29.1

### Fixed

- Priority sampling not activating by default ([#868][])

## [0.29.0] - 2019-11-20

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.29.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.28.0...v0.29.0

### Added

- Tracer health metrics ([#838][], [#859][])

### Changed

- Default trace buffer size from 100 to 1000 ([#865][])
- Rack request start headers to accept more values ([#832][]) ([@JamesHarker][])
- Faraday to apply default instrumentation out-of-the-box ([#786][], [#843][]) ([@mdross95][])

### Fixed

- Synthetics trace context being ignored ([#856][])

### Refactored

- Tracer buffer constants ([#851][])

### Removed

- Some old Ruby 1.9 code ([#819][], [#844][])

## [0.28.0] - 2019-10-01

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.28.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.27.0...v0.28.0

### Added

- Support for Rails 6.0 ([#814][])
- Multiplexing on hostname/port for Dalli ([#823][])
- Support for Redis array arguments ([#796][], [#817][]) ([@brafales][])

### Refactored

- Encapsulate span resource name in Faraday integration ([#811][]) ([@giancarlocosta][])

## [0.27.0] - 2019-09-04

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.27.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.26.0...v0.27.0

Support for Ruby < 2.0 is *removed*. Plan for timeline is as follows:

 - 0.25.0: Support for Ruby < 2.0 is deprecated; retains full feature support.
 - 0.26.0: Last version to support Ruby < 2.0; any new features will not support 1.9.
 - 0.27.0: Support for Ruby < 2.0 is removed.

Version 0.26.x will receive only critical bugfixes for 1 year following the release of 0.26.0 (August 6th, 2020.)

### Added

- Support for Ruby 2.5 & 2.6 ([#800][], [#802][])
- Ethon integration ([#527][], [#778][]) ([@al-kudryavtsev][])

### Refactored

- Rails integration into smaller integrations per component ([#747][], [#762][], [#795][])

### Removed

- Support for Ruby 1.9 ([#791][])

## [0.26.0] - 2019-08-06

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.26.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.25.1...v0.26.0

Support for Ruby < 2.0 is *deprecated*. Plan for timeline is as follows:

 - 0.25.0: Support for Ruby < 2.0 is deprecated; retains full feature support.
 - 0.26.0: Last version to support Ruby < 2.0; any new features will not support 1.9.
 - 0.27.0: Support for Ruby < 2.0 is removed.

Version 0.26.x will receive only critical bugfixes for 1 year following the release of 0.26.0 (August 6th, 2020.)

### Added

- Container ID tagging for containerized environments ([#784][])

### Refactored

- Datadog::Metrics constants ([#789][])

### Removed

- Datadog::HTTPTransport and related components ([#782][])

## [0.25.1] - 2019-07-16

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.25.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.25.0...v0.25.1

### Fixed

- Redis integration not quantizing AUTH command ([#776][])

## [0.25.0] - 2019-06-27

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.25.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.24.0...v0.25.0

Support for Ruby < 2.0 is *deprecated*. Plan for timeline is as follows:

 - 0.25.0: Support for Ruby < 2.0 is deprecated; retains full feature support.
 - 0.26.0: Last version to support Ruby < 2.0; any new features will not support 1.9.
 - 0.27.0: Support for Ruby < 2.0 is removed.

Version 0.26.x will receive only critical bugfixes for 1 year following the release of 0.26.0.

### Added

- Unix socket support for transport layer ([#770][])

### Changed

- Renamed 'ForcedTracing' to 'ManualTracing' ([#765][])

### Fixed

- HTTP headers for distributed tracing sometimes appearing in duplicate ([#768][])

### Refactored

- Transport layer ([#628][])

### Deprecated

- Ruby < 2.0 support ([#771][])
- Use of `Datadog::HTTPTransport` ([#628][])
- Use of `Datadog::Ext::ForcedTracing` ([#765][])

## [0.24.0] - 2019-05-21

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.24.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.23.3...v0.24.0

### Added

- B3 header support ([#753][])
- Hostname tagging option ([#760][])
- Contribution and development guides ([#754][])

## [0.23.3] - 2019-05-16

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.23.3

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.23.2...v0.23.3

### Fixed

- Integrations initializing tracer at load time ([#756][])

## [0.23.2] - 2019-05-10

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.23.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.23.1...v0.23.2

### Fixed

- Span types for HTTP, web, and some datastore integrations ([#751][])
- AWS integration not patching service-level gems ([#707][], [#752][]) ([@alksl][], [@tonypinder][])
- Rails 6 warning for `parent_name` ([#750][]) ([@sinsoku][])

## [0.23.1] - 2019-05-02

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.23.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.23.0...v0.23.1

### Fixed

- NoMethodError runtime_metrics for SyncWriter ([#748][])

## [0.23.0] - 2019-04-30

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.23.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.22.0...v0.23.0

### Added

- Error status support via tags for OpenTracing ([#739][])
- Forced sampling support via tags ([#720][])

### Fixed

- Wrong return values for Rake integration ([#742][]) ([@Redapted][])

### Removed

- Obsolete service telemetry ([#738][])

## [0.22.0] - 2019-04-15

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.22.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.21.2...v0.22.0

In this release we are adding initial support for the **beta** [Runtime metrics collection](https://docs.datadoghq.com/tracing/advanced/runtime_metrics/?tab=ruby) feature.

### Changed

- Add warning log if an integration is incompatible ([#722][]) ([@ericmustin][])

### Added

- Initial beta support for Runtime metrics collection ([#677][])

## [0.21.2] - 2019-04-10

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.21.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.21.1...v0.21.2

### Changed

- Support Mongo gem 2.5+ ([#729][], [#731][]) ([@ricbartm][])

## [0.21.1] - 2019-03-26

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.21.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.21.0...v0.21.1

### Changed

- Support `TAG_ENABLED` for custom instrumentation with analytics. ([#728][])

## [0.21.0] - 2019-03-20

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.21.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.20.0...v0.21.0

### Added

- Trace analytics support ([#697][], [#715][])
- HTTP after_request span hook ([#716][], [#724][])

### Fixed

- Distributed traces with IDs in 2^64 range being dropped ([#719][])
- Custom logger level forced to warning ([#681][], [#721][]) ([@blaines][], [@ericmustin][])

### Refactored

- Global configuration for tracing into configuration API ([#714][])

## [0.20.0] - 2019-03-07

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.20.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.19.1...v0.20.0

This release will log deprecation warnings for any usage of `Datadog::Pin`.
These changes are backwards compatible, but all integration configuration should be moved away from `Pin` and to the configuration API instead.

### Added

- Propagate synthetics origin header ([#699][])

### Changed

- Enable distributed tracing by default ([#701][])

### Fixed

- Fix Rack http_server.queue spans missing from distributed traces ([#709][])

### Refactored

- Refactor MongoDB to use instrumentation module ([#704][])
- Refactor HTTP to use instrumentation module ([#703][])
- Deprecate GRPC global pin in favor of configuration API ([#702][])
- Deprecate Grape pin in favor of configuration API ([#700][])
- Deprecate Faraday pin in favor of configuration API ([#696][])
- Deprecate Dalli pin in favor of configuration API ([#693][])

## [0.19.1] - 2019-02-07

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.19.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.19.0...v0.19.1

### Added

- Documentation for Lograge implementation ([#683][], [#687][]) ([@nic-lan][])

### Fixed

- Priority sampling dropping spans ([#686][])

## [0.19.0] - 2019-01-22

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.19.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.18.3...v0.19.0

### Added

- Tracer#active_correlation for adding correlation IDs to logs. ([#660][], [#664][], [#673][])
- Opt-in support for `event_sample_rate` tag for some integrations. ([#665][], [#666][])

### Changed

- Priority sampling enabled by default. ([#654][])

## [0.18.3] - 2019-01-17

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.18.3

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.18.2...v0.18.3

### Fixed

- Mongo `NoMethodError` when no span available during `#failed`. ([#674][], [#675][]) ([@Azure7111][])
- Rack deprecation warnings firing with some 3rd party libraries present. ([#672][])
- Shoryuken resource name when used with ActiveJob. ([#671][]) ([@aurelian][])

## [0.18.2] - 2019-01-03

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.18.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.18.1...v0.18.2

### Fixed

- Unfinished Mongo spans when SASL configured ([#658][]) ([@zachmccormick][])
- Possible performance issue with unexpanded Rails cache keys ([#630][], [#635][]) ([@gingerlime][])

## [0.18.1] - 2018-12-20

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.18.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.18.0...v0.18.1

### Fixed

- ActiveRecord `SystemStackError` with some 3rd party libraries ([#661][], [#662][]) ([@EpiFouloux][], [@tjgrathwell][], [@guizmaii][])

## [0.18.0] - 2018-12-18

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.18.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.17.3...v0.18.0

### Added

- Shoryuken integration ([#538][], [#626][], [#655][]) ([@steveh][], [@JustSnow][])
- Sidekiq client integration ([#602][], [#650][]) ([@dirk][])
- Datadog::Shim for adding instrumentation ([#648][])

### Changed

- Use `DD_AGENT_HOST` and `DD_TRACE_AGENT_PORT` env vars if available ([#631][])
- Inject `:connection` into `sql.active_record` event ([#640][], [#649][], [#656][]) ([@guizmaii][])
- Return default configuration instead of `nil` on miss ([#651][])

## [0.17.3] - 2018-11-29

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.17.3

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.17.2...v0.17.3

### Fixed

- Bad resource names for Grape::API objects in Grape 1.2.0 ([#639][])
- RestClient raising NoMethodError when response is `nil` ([#636][], [#642][]) ([@frsantos][])
- Rack middleware inserted twice in some Rails applications ([#641][])

## [0.17.2] - 2018-11-23

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.17.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.17.1...v0.17.2

### Fixed

- Resque integration shutting down tracer when forking is disabled ([#637][])

## [0.17.1] - 2018-11-07

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.17.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.17.0...v0.17.1

### Fixed

- RestClient incorrect app type ([#583][]) ([@gaborszakacs][])
- DelayedJob incorrect job name when used with ActiveJob ([#605][]) ([@agirlnamedsophia][])

## [0.17.0] - 2018-10-30

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.17.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.16.1...v0.17.0

### Added

- [BETA] Span memory `allocations` attribute ([#597][]) ([@dasch][])

### Changed

- Use Rack Env to update resource in Rails ([#580][]) ([@dasch][])
- Expand support for Sidekiq to 3.5.4+ ([#593][])
- Expand support for mysql2 to 0.3.21+ ([#578][])

### Refactored

- Upgraded integrations to new API ([#544][])
- Encoding classes into modules ([#598][])

## [0.16.1] - 2018-10-17

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.16.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.16.0...v0.16.1

### Fixed

- Priority sampling response being mishandled ([#591][])
- HTTP open timeout to agent too long ([#582][])

## [0.16.0] - 2018-09-18

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.16.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.15.0...v0.16.0

### Added

- OpenTracing support ([#517][])
- `middleware` option for disabling Rails trace middleware. ([#552][])

## [0.15.0] - 2018-09-12

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.15.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.14.2...v0.15.0

### Added

- Rails 5.2 support ([#535][])
- Context propagation support for `Concurrent::Future` ([#415][], [#496][])

### Fixed

- Grape uninitialized constant TraceMiddleware ([#525][], [#533][]) ([@dim][])
- Signed integer trace and span IDs being discarded in distributed traces ([#530][]) ([@alloy][])

## [0.14.2] - 2018-08-23

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.14.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.14.1...v0.14.2

### Fixed

- Sampling priority from request headers not being used ([#521][])

## [0.14.1] - 2018-08-21

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.14.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.14.0...v0.14.1

### Changed

- Reduce verbosity of connection errors in log ([#515][])

### Fixed

- Sequel 'not a valid integration' error ([#514][], [#516][]) ([@steveh][])

## [0.14.0] - 2018-08-14

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.14.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.13.2...v0.14.0

### Added

- RestClient integration ([#422][], [#460][])
- DelayedJob integration ([#393][] [#444][])
- Version information to integrations ([#483][])
- Tracer#active_root_span helper ([#503][])

### Changed

- Resque to flush traces when Job finishes instead of using SyncWriter ([#474][])
- ActiveRecord to allow configuring multiple databases ([#451][])
- Integrations configuration settings ([#450][], [#452][], [#451][])

### Fixed

- Context propagation for distributed traces when context is full ([#502][])
- Rake shutdown tracer after execution ([#487][]) ([@kissrobber][])
- Deprecation warnings fired using Unicorn ([#508][])

## [0.14.0.rc1] - 2018-08-08

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.14.0.rc1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.14.0.beta2...v0.14.0.rc1

### Added

- RestClient integration ([#422][], [#460][])
- Tracer#active_root_span helper ([#503][])

### Fixed

- Context propagation for distributed traces when context is full ([#502][])

## [0.14.0.beta2] - 2018-07-25

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.14.0.beta2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.14.0.beta1...v0.14.0.beta2

### Fixed

- Rake shutdown tracer after execution ([#487][]) [@kissrobber][]

## [0.14.0.beta1] - 2018-07-24

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.14.0.beta1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.13.1...v0.14.0.beta1

### Changed

- Resque to flush traces when Job finishes instead of using SyncWriter ([#474][])
- ActiveRecord to allow configuring multiple databases ([#451][])
- Integrations configuration settings ([#450][], [#452][], [#451][])

### Fixed

- Ruby warnings during tests ([#499][])
- Tests failing intermittently on Ruby 1.9.3 ([#497][])

### Added

- DelayedJob integration ([#393][] [#444][])
- Version information to integrations ([#483][])

## [0.13.2] - 2018-08-07

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.13.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.13.1...v0.13.2

### Fixed

- Context propagation for distributed traces when context is full ([#502][])

## [0.13.1] - 2018-07-17

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.13.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.13.0...v0.13.1

### Changed

- Configuration class variables don't lazy load ([#477][])
- Default tracer host `localhost` --> `127.0.0.1` ([#466][], [#480][]) ([@NobodysNightmare][])

### Fixed

- Workers not shutting down quickly in some short running processes ([#475][])
- Missing documentation for mysql2 and Rails ([#476][], [#488][])
- Missing variable in rescue block ([#481][]) ([@kitop][])
- Unclosed spans in ActiveSupport::Notifications with multithreading ([#431][], [#478][]) ([@senny][])

## [0.13.0] - 2018-06-20

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.13.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.12.1...v0.13.0

### Added

- Sequel integration (supporting Ruby 2.0+) ([#171][], [#367][]) ([@randy-girard][], [@twe4ked][], [@palin][])
- gRPC integration (supporting Ruby 2.2+) ([#379][], [#403][]) ([@Jared-Prime][])
- ActiveModelSerializers integration ([#340][]) ([@sullimander][])
- Excon integration ([#211][], [#426][]) ([@walterking][], [@jeffjo][])
- Rake integration (supporting Ruby 2.0+, Rake 12.0+) ([#409][])
- Request queuing tracing to Rack (experimental) ([#272][])
- ActiveSupport::Notifications::Event helper for event tracing ([#400][])
- Request and response header tags to Rack ([#389][])
- Request and response header tags to Sinatra ([#427][], [#375][])
- MySQL2 integration ([#453][]) ([@jamiehodge][])
- Sidekiq job delay tag ([#443][], [#418][]) ([@gottfrois][])

### Fixed

- Elasticsearch quantization of ids ([#458][])
- MongoDB to allow quantization of collection name ([#463][])

### Refactored

- Hash quantization into core library ([#410][])
- MongoDB integration to use Hash quantization library ([#463][])

### Changed

- Hash quantization truncates arrays with nested objects ([#463][])

## [0.13.0.beta1] - 2018-05-09

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.13.0.beta1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.12.0...v0.13.0.beta1

### Added

- Sequel integration (supporting Ruby 2.0+) ([#171][], [#367][]) ([@randy-girard][], [@twe4ked][], [@palin][])
- gRPC integration (supporting Ruby 2.2+) ([#379][], [#403][]) ([@Jared-Prime][])
- ActiveModelSerializers integration ([#340][]) ([@sullimander][])
- Excon integration ([#211][]) ([@walterking][])
- Rake integration (supporting Ruby 2.0+, Rake 12.0+) ([#409][])
- Request queuing tracing to Rack (experimental) ([#272][])
- ActiveSupport::Notifications::Event helper for event tracing ([#400][])
- Request and response header tags to Rack ([#389][])

### Refactored

- Hash quantization into core library ([#410][])

## [0.12.1] - 2018-06-12

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.12.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.12.0...v0.12.1

### Changed

- Cache configuration `Proxy` objects ([#446][])
- `freeze` more constant strings, to improve memory usage ([#446][])
 - `Utils#truncate` to use slightly less memory ([#446][])

### Fixed

- Net/HTTP integration not permitting `service_name` to be overridden. ([#407][], [#430][]) ([@undergroundwebdesigns][])
- Block not being passed through Elasticsearch client initialization. ([#421][]) ([@shayonj][])
- Devise raising `NoMethodError` when bad login attempts are made. ([#419][], [#420][]) ([@frsantos][])
- AWS spans using wrong resource name ([#374][], [#377][]) ([@jfrancoist][])
- ActionView `NoMethodError` on very long traces. ([#445][], [#447][]) ([@jvalanen][])

### Refactored

- ActionController patching strategy using modules. ([#439][])
- ActionView tracing strategy. ([#445][], [#447][])

## [0.12.0] - 2018-05-08

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.12.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.11.4...v0.12.0

### Added

- GraphQL integration (supporting graphql 1.7.9+) ([#295][])
- ActiveRecord object instantiation tracing ([#311][], [#334][])
- Subscriber module for ActiveSupport::Notifications tracing ([#324][], [#380][], [#390][], [#395][]) ([@dasch][])
- HTTP quantization module ([#384][])
- Partial flushing option to tracer ([#247][], [#397][])

### Changed

- Rack applies URL quantization by default ([#371][])
- Elasticsearch applies body quantization by default ([#362][])
- Context for a single trace now has hard limit of 100,000 spans ([#247][])
- Tags with `rails.db.x` to `active_record.db.x` instead ([#396][])

### Fixed

- Loading the ddtrace library after Rails has fully initialized can result in load errors. ([#357][])
- Some scenarios where `middleware_names` could result in bad resource names ([#354][])
- ActionController instrumentation conflicting with some gems that monkey patch Rails ([#391][])

### Deprecated

- Use of `:datadog_rack_request_span` variable in favor of `'datadog.rack_request_span'` in Rack. ([#365][], [#392][])

### Refactored

- Racecar to use ActiveSupport::Notifications Subscriber module ([#381][])
- Rails to use ActiveRecord integration instead of its own implementation ([#396][])
- ActiveRecord to use ActiveSupport::Notifications Subscriber module ([#396][])

## [0.12.0.rc1] - 2018-04-11

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.12.0.rc1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.11.4...v0.12.0.rc1

### Added

- GraphQL integration (supporting graphql 1.7.9+) ([#295][])
- ActiveRecord object instantiation tracing ([#311][], [#334][])
- Subscriber module for ActiveSupport::Notifications tracing ([#324][], [#380][], [#390][], [#395][]) ([@dasch][])
- HTTP quantization module ([#384][])
- Partial flushing option to tracer ([#247][], [#397][])

### Changed

- Rack applies URL quantization by default ([#371][])
- Elasticsearch applies body quantization by default ([#362][])
- Context for a single trace now has hard limit of 100,000 spans ([#247][])
- Tags with `rails.db.x` to `active_record.db.x` instead ([#396][])

### Fixed

- Loading the ddtrace library after Rails has fully initialized can result in load errors. ([#357][])
- Some scenarios where `middleware_names` could result in bad resource names ([#354][])
- ActionController instrumentation conflicting with some gems that monkey patch Rails ([#391][])

### Deprecated

- Use of `:datadog_rack_request_span` variable in favor of `'datadog.rack_request_span'` in Rack. ([#365][], [#392][])

### Refactored

- Racecar to use ActiveSupport::Notifications Subscriber module ([#381][])
- Rails to use ActiveRecord integration instead of its own implementation ([#396][])
- ActiveRecord to use ActiveSupport::Notifications Subscriber module ([#396][])

## [0.12.0.beta2] - 2018-02-28

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.12.0.beta2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.12.0.beta1...v0.12.0.beta2

### Fixed

- Loading the ddtrace library after Rails has fully initialized can result in load errors. ([#357][])

## [0.12.0.beta1] - 2018-02-09

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.12.0.beta1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.11.2...v0.12.0.beta1

### Added

- GraphQL integration (supporting graphql 1.7.9+) ([#295][])
- ActiveRecord object instantiation tracing ([#311][], [#334][])
- `http.request_id` tag to Rack spans ([#335][])

## [0.11.4] - 2018-03-29

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.11.4

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.11.3...v0.11.4

### Fixed

- Transport body parsing when downgrading ([#369][])
- Transport incorrectly attempting to apply sampling to service metadata ([#370][])
- `sql.active_record` traces showing incorrect adapter settings when non-default adapter used ([#383][])

## [0.11.3] - 2018-03-06

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.11.3

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.11.2...v0.11.3

### Added

- CHANGELOG.md ([#350][], [#363][]) ([@awendt][])
- `http.request_id` tag to Rack spans ([#335][])
- Tracer configuration to README.md ([#332][]) ([@noma4i][])

### Fixed

- Extra indentation in README.md ([#349][]) ([@ck3g][])
- `http.url` when Rails raises exceptions ([#351][], [#353][])
- Rails from being patched twice ([#352][])
- 4XX responses from middleware being marked as errors ([#345][])
- Rails exception middleware sometimes not being inserted at correct position ([#345][])
- Processing pipeline documentation typo ([#355][]) ([@MMartyn][])
- Loading the ddtrace library after Rails has fully initialized can result in load errors. ([#357][])
- Use of block syntax with Rails `render` not working ([#359][], [#360][]) ([@dorner][])

## [0.11.2] - 2018-02-02

**Critical update**: `Datadog::Monkey` removed in version 0.11.1. Adds `Datadog::Monkey` back as no-op, deprecated module.

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.11.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.11.1...v0.11.2

### Deprecated

- `Datadog::Monkey` to be no-op and print deprecation warnings.

## [0.11.1] - 2018-01-29

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.11.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.11.0...v0.11.1

### Added

- `http.base_url` tag for Rack applications ([#301][], [#327][])
- `distributed_tracing` option to Sinatra ([#325][])
- `exception_controller` option to Rails ([#320][])

### Changed

- Decoupled Sinatra and ActiveRecord integrations ([#328][], [#330][]) ([@hawknewton][])
- Racecar uses preferred ActiveSupport::Notifications strategy ([#323][])

### Removed

- `Datadog::Monkey` in favor of newer configuration API ([#322][])

### Fixed

- Custom resource names from Rails controllers being overridden ([#321][])
- Custom Rails exception controllers reporting as the resource ([#320][])

## [0.11.0] - 2018-01-17

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.11.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.10.0...v0.11.0

## [0.11.0.beta2] - 2017-12-27

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.11.0.beta2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.11.0.beta1...v0.11.0.beta2

## [0.11.0.beta1] - 2017-12-04

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.11.0.beta1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.10.0...v0.11.0.beta1

## [0.10.0] - 2017-11-30

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.10.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.9.2...v0.10.0

## [0.9.2] - 2017-11-03

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.9.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.9.1...v0.9.2

## [0.9.1] - 2017-11-02

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.9.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.9.0...v0.9.1

## [0.9.0] - 2017-10-06

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.9.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.8.2...v0.9.0

## [0.8.2] - 2017-09-08

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.8.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.8.1...v0.8.2

## [0.8.1] - 2017-08-10

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.8.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.8.0...v0.8.1

## [0.8.0] - 2017-07-24

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.8.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.7.2...v0.8.0

## [0.7.2] - 2017-05-24

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.7.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.7.1...v0.7.2

## [0.7.1] - 2017-05-10

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.7.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.7.0...v0.7.1

## [0.7.0] - 2017-04-24

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.7.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.6.2...v0.7.0

## [0.6.2] - 2017-04-07

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.6.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.6.1...v0.6.2

## [0.6.1] - 2017-04-05

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.6.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.6.0...v0.6.1

## [0.6.0] - 2017-03-28

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.6.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.5.0...v0.6.0

## [0.5.0] - 2017-03-08

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.5.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.4.3...v0.5.0

## [0.4.3] - 2017-02-17

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.4.3

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.4.2...v0.4.3

## [0.4.2] - 2017-02-14

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.4.2

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.4.1...v0.4.2

## [0.4.1] - 2017-02-14

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.4.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.4.0...v0.4.1

## [0.4.0] - 2017-01-24

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.4.0

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.3.1...v0.4.0

## [0.3.1] - 2017-01-23

Release notes: https://github.com/DataDog/dd-trace-rb/releases/tag/v0.3.1

Git diff: https://github.com/DataDog/dd-trace-rb/compare/v0.3.0...v0.3.1

[Unreleased]: https://github.com/DataDog/dd-trace-rb/compare/v1.4.2...master
[1.5.0]: https://github.com/DataDog/dd-trace-rb/compare/v1.4.2...v1.5.0
[1.4.1]: https://github.com/DataDog/dd-trace-rb/compare/v1.4.1...v1.4.2
[1.4.1]: https://github.com/DataDog/dd-trace-rb/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/DataDog/dd-trace-rb/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/DataDog/dd-trace-rb/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/DataDog/dd-trace-rb/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/DataDog/dd-trace-rb/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/DataDog/dd-trace-rb/compare/v1.0.0.beta2...v1.0.0
[1.0.0.beta2]: https://github.com/DataDog/dd-trace-rb/compare/v1.0.0.beta1...v1.0.0.beta2
[1.0.0.beta1]: https://github.com/DataDog/dd-trace-rb/compare/v0.54.2...v1.0.0.beta1
[0.54.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.54.1...v0.54.2
[0.54.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.54.0...v0.54.1
[0.54.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.53.0...v0.54.0
[0.53.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.52.0...v0.53.0
[0.52.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.51.1...v0.52.0
[0.51.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.51.0...v0.51.1
[0.51.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.50.0...v0.51.0
[0.48.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.47.0...v0.48.0
[0.47.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.46.0...v0.47.0
[0.46.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.45.0...v0.46.0
[0.45.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.44.0...v0.45.0
[0.44.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.43.0...v0.44.0
[0.43.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.42.0...v0.43.0
[0.41.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.40.0...v0.41.0
[0.40.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.39.0...v0.40.0
[0.39.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.38.0...v0.39.0
[0.38.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.37.0...v0.38.0
[0.37.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.36.0...v0.37.0
[0.36.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.35.2...v0.36.0
[0.35.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.35.1...v0.35.2
[0.35.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.35.0...v0.35.1
[0.35.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.34.2...v0.35.0
[0.34.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.34.1...v0.34.2
[0.34.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.34.0...v0.34.1
[0.34.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.33.1...v0.34.0
[0.33.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.33.0...v0.33.1
[0.33.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.32.0...v0.33.0
[0.32.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.31.1...v0.32.0
[0.31.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.31.0...v0.31.1
[0.31.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.30.1...v0.31.0
[0.30.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.30.0...v0.30.1
[0.30.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.29.1...v0.30.0
[0.29.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.29.0...v0.29.1
[0.29.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.28.0...v0.29.0
[0.28.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.27.0...v0.28.0
[0.27.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.26.0...v0.27.0
[0.26.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.25.1...v0.26.0
[0.25.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.25.0...v0.25.1
[0.25.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.24.0...v0.25.0
[0.24.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.23.3...v0.24.0
[0.23.3]: https://github.com/DataDog/dd-trace-rb/compare/v0.23.2...v0.23.3
[0.23.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.23.1...v0.23.2
[0.23.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.23.0...v0.23.1
[0.23.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.22.0...v0.23.0
[0.22.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.21.2...v0.22.0
[0.21.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.21.1...v0.21.2
[0.21.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.21.0...v0.21.1
[0.21.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.20.0...v0.21.0
[0.20.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.19.1...v0.20.0
[0.19.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.19.0...v0.19.1
[0.19.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.18.3...v0.19.0
[0.18.3]: https://github.com/DataDog/dd-trace-rb/compare/v0.18.2...v0.18.3
[0.18.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.18.1...v0.18.2
[0.18.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.18.0...v0.18.1
[0.18.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.17.3...v0.18.0
[0.17.3]: https://github.com/DataDog/dd-trace-rb/compare/v0.17.2...v0.17.3
[0.17.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.17.1...v0.17.2
[0.17.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.17.0...v0.17.1
[0.17.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.16.1...v0.17.0
[0.16.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.16.0...v0.16.1
[0.16.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.15.0...v0.16.0
[0.15.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.14.2...v0.15.0
[0.14.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.14.1...v0.14.2
[0.14.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.14.0...v0.14.1
[0.14.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.13.2...v0.14.0
[0.14.0.rc1]: https://github.com/DataDog/dd-trace-rb/compare/v0.14.0.beta2...v0.14.0.rc1
[0.14.0.beta2]: https://github.com/DataDog/dd-trace-rb/compare/v0.14.0.beta1...v0.14.0.beta2
[0.14.0.beta1]: https://github.com/DataDog/dd-trace-rb/compare/v0.13.0...v0.14.0.beta1
[0.13.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.13.1...v0.13.2
[0.13.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.13.0...v0.13.1
[0.13.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.12.1...v0.13.0
[0.13.0.beta1]: https://github.com/DataDog/dd-trace-rb/compare/v0.12.0...v0.13.0.beta1
[0.12.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.12.0...v0.12.1
[0.12.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.11.4...v0.12.0
[0.12.0.rc1]: https://github.com/DataDog/dd-trace-rb/compare/v0.11.4...v0.12.0.rc1
[0.12.0.beta2]: https://github.com/DataDog/dd-trace-rb/compare/v0.12.0.beta1...v0.12.0.beta2
[0.12.0.beta1]: https://github.com/DataDog/dd-trace-rb/compare/v0.11.2...v0.12.0.beta1
[0.11.4]: https://github.com/DataDog/dd-trace-rb/compare/v0.11.3...v0.11.4
[0.11.3]: https://github.com/DataDog/dd-trace-rb/compare/v0.11.2...v0.11.3
[0.11.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.11.1...v0.11.2
[0.11.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.11.0...v0.11.1
[0.11.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.10.0...v0.11.0
[0.11.0.beta2]: https://github.com/DataDog/dd-trace-rb/compare/v0.11.0.beta1...v0.11.0.beta2
[0.11.0.beta1]: https://github.com/DataDog/dd-trace-rb/compare/v0.10.0...v0.11.0.beta1
[0.10.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.9.2...v0.10.0
[0.9.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.9.1...v0.9.2
[0.9.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.9.0...v0.9.1
[0.9.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.8.2...v0.9.0
[0.8.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.8.1...v0.8.2
[0.8.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.8.0...v0.8.1
[0.8.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.7.2...v0.8.0
[0.7.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.7.1...v0.7.2
[0.7.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.7.0...v0.7.1
[0.7.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.6.2...v0.7.0
[0.6.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.6.1...v0.6.2
[0.6.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.6.0...v0.6.1
[0.6.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.4.3...v0.5.0
[0.4.3]: https://github.com/DataDog/dd-trace-rb/compare/v0.4.2...v0.4.3
[0.4.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.4.1...v0.4.2
[0.4.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.3.1...v0.4.0
[0.3.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/DataDog/dd-trace-rb/compare/v0.1.5...v0.2.0
[0.1.5]: https://github.com/DataDog/dd-trace-rb/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/DataDog/dd-trace-rb/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/DataDog/dd-trace-rb/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/DataDog/dd-trace-rb/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/DataDog/dd-trace-rb/compare/v0.1.0...v0.1.1

<!--- The following link definition list is generated by PimpMyChangelog --->
[#132]: https://github.com/DataDog/dd-trace-rb/issues/132
[#171]: https://github.com/DataDog/dd-trace-rb/issues/171
[#211]: https://github.com/DataDog/dd-trace-rb/issues/211
[#247]: https://github.com/DataDog/dd-trace-rb/issues/247
[#272]: https://github.com/DataDog/dd-trace-rb/issues/272
[#295]: https://github.com/DataDog/dd-trace-rb/issues/295
[#301]: https://github.com/DataDog/dd-trace-rb/issues/301
[#311]: https://github.com/DataDog/dd-trace-rb/issues/311
[#320]: https://github.com/DataDog/dd-trace-rb/issues/320
[#321]: https://github.com/DataDog/dd-trace-rb/issues/321
[#322]: https://github.com/DataDog/dd-trace-rb/issues/322
[#323]: https://github.com/DataDog/dd-trace-rb/issues/323
[#324]: https://github.com/DataDog/dd-trace-rb/issues/324
[#325]: https://github.com/DataDog/dd-trace-rb/issues/325
[#327]: https://github.com/DataDog/dd-trace-rb/issues/327
[#328]: https://github.com/DataDog/dd-trace-rb/issues/328
[#330]: https://github.com/DataDog/dd-trace-rb/issues/330
[#332]: https://github.com/DataDog/dd-trace-rb/issues/332
[#334]: https://github.com/DataDog/dd-trace-rb/issues/334
[#335]: https://github.com/DataDog/dd-trace-rb/issues/335
[#340]: https://github.com/DataDog/dd-trace-rb/issues/340
[#345]: https://github.com/DataDog/dd-trace-rb/issues/345
[#349]: https://github.com/DataDog/dd-trace-rb/issues/349
[#350]: https://github.com/DataDog/dd-trace-rb/issues/350
[#351]: https://github.com/DataDog/dd-trace-rb/issues/351
[#352]: https://github.com/DataDog/dd-trace-rb/issues/352
[#353]: https://github.com/DataDog/dd-trace-rb/issues/353
[#354]: https://github.com/DataDog/dd-trace-rb/issues/354
[#355]: https://github.com/DataDog/dd-trace-rb/issues/355
[#357]: https://github.com/DataDog/dd-trace-rb/issues/357
[#359]: https://github.com/DataDog/dd-trace-rb/issues/359
[#360]: https://github.com/DataDog/dd-trace-rb/issues/360
[#362]: https://github.com/DataDog/dd-trace-rb/issues/362
[#363]: https://github.com/DataDog/dd-trace-rb/issues/363
[#365]: https://github.com/DataDog/dd-trace-rb/issues/365
[#367]: https://github.com/DataDog/dd-trace-rb/issues/367
[#369]: https://github.com/DataDog/dd-trace-rb/issues/369
[#370]: https://github.com/DataDog/dd-trace-rb/issues/370
[#371]: https://github.com/DataDog/dd-trace-rb/issues/371
[#374]: https://github.com/DataDog/dd-trace-rb/issues/374
[#375]: https://github.com/DataDog/dd-trace-rb/issues/375
[#377]: https://github.com/DataDog/dd-trace-rb/issues/377
[#379]: https://github.com/DataDog/dd-trace-rb/issues/379
[#380]: https://github.com/DataDog/dd-trace-rb/issues/380
[#381]: https://github.com/DataDog/dd-trace-rb/issues/381
[#383]: https://github.com/DataDog/dd-trace-rb/issues/383
[#384]: https://github.com/DataDog/dd-trace-rb/issues/384
[#389]: https://github.com/DataDog/dd-trace-rb/issues/389
[#390]: https://github.com/DataDog/dd-trace-rb/issues/390
[#391]: https://github.com/DataDog/dd-trace-rb/issues/391
[#392]: https://github.com/DataDog/dd-trace-rb/issues/392
[#393]: https://github.com/DataDog/dd-trace-rb/issues/393
[#395]: https://github.com/DataDog/dd-trace-rb/issues/395
[#396]: https://github.com/DataDog/dd-trace-rb/issues/396
[#397]: https://github.com/DataDog/dd-trace-rb/issues/397
[#400]: https://github.com/DataDog/dd-trace-rb/issues/400
[#403]: https://github.com/DataDog/dd-trace-rb/issues/403
[#407]: https://github.com/DataDog/dd-trace-rb/issues/407
[#409]: https://github.com/DataDog/dd-trace-rb/issues/409
[#410]: https://github.com/DataDog/dd-trace-rb/issues/410
[#415]: https://github.com/DataDog/dd-trace-rb/issues/415
[#418]: https://github.com/DataDog/dd-trace-rb/issues/418
[#419]: https://github.com/DataDog/dd-trace-rb/issues/419
[#420]: https://github.com/DataDog/dd-trace-rb/issues/420
[#421]: https://github.com/DataDog/dd-trace-rb/issues/421
[#422]: https://github.com/DataDog/dd-trace-rb/issues/422
[#424]: https://github.com/DataDog/dd-trace-rb/issues/424
[#426]: https://github.com/DataDog/dd-trace-rb/issues/426
[#427]: https://github.com/DataDog/dd-trace-rb/issues/427
[#430]: https://github.com/DataDog/dd-trace-rb/issues/430
[#431]: https://github.com/DataDog/dd-trace-rb/issues/431
[#439]: https://github.com/DataDog/dd-trace-rb/issues/439
[#443]: https://github.com/DataDog/dd-trace-rb/issues/443
[#444]: https://github.com/DataDog/dd-trace-rb/issues/444
[#445]: https://github.com/DataDog/dd-trace-rb/issues/445
[#446]: https://github.com/DataDog/dd-trace-rb/issues/446
[#447]: https://github.com/DataDog/dd-trace-rb/issues/447
[#450]: https://github.com/DataDog/dd-trace-rb/issues/450
[#451]: https://github.com/DataDog/dd-trace-rb/issues/451
[#452]: https://github.com/DataDog/dd-trace-rb/issues/452
[#453]: https://github.com/DataDog/dd-trace-rb/issues/453
[#458]: https://github.com/DataDog/dd-trace-rb/issues/458
[#460]: https://github.com/DataDog/dd-trace-rb/issues/460
[#463]: https://github.com/DataDog/dd-trace-rb/issues/463
[#466]: https://github.com/DataDog/dd-trace-rb/issues/466
[#474]: https://github.com/DataDog/dd-trace-rb/issues/474
[#475]: https://github.com/DataDog/dd-trace-rb/issues/475
[#476]: https://github.com/DataDog/dd-trace-rb/issues/476
[#477]: https://github.com/DataDog/dd-trace-rb/issues/477
[#478]: https://github.com/DataDog/dd-trace-rb/issues/478
[#480]: https://github.com/DataDog/dd-trace-rb/issues/480
[#481]: https://github.com/DataDog/dd-trace-rb/issues/481
[#483]: https://github.com/DataDog/dd-trace-rb/issues/483
[#486]: https://github.com/DataDog/dd-trace-rb/issues/486
[#487]: https://github.com/DataDog/dd-trace-rb/issues/487
[#488]: https://github.com/DataDog/dd-trace-rb/issues/488
[#496]: https://github.com/DataDog/dd-trace-rb/issues/496
[#497]: https://github.com/DataDog/dd-trace-rb/issues/497
[#499]: https://github.com/DataDog/dd-trace-rb/issues/499
[#502]: https://github.com/DataDog/dd-trace-rb/issues/502
[#503]: https://github.com/DataDog/dd-trace-rb/issues/503
[#508]: https://github.com/DataDog/dd-trace-rb/issues/508
[#514]: https://github.com/DataDog/dd-trace-rb/issues/514
[#515]: https://github.com/DataDog/dd-trace-rb/issues/515
[#516]: https://github.com/DataDog/dd-trace-rb/issues/516
[#517]: https://github.com/DataDog/dd-trace-rb/issues/517
[#521]: https://github.com/DataDog/dd-trace-rb/issues/521
[#525]: https://github.com/DataDog/dd-trace-rb/issues/525
[#527]: https://github.com/DataDog/dd-trace-rb/issues/527
[#529]: https://github.com/DataDog/dd-trace-rb/issues/529
[#530]: https://github.com/DataDog/dd-trace-rb/issues/530
[#533]: https://github.com/DataDog/dd-trace-rb/issues/533
[#535]: https://github.com/DataDog/dd-trace-rb/issues/535
[#538]: https://github.com/DataDog/dd-trace-rb/issues/538
[#544]: https://github.com/DataDog/dd-trace-rb/issues/544
[#552]: https://github.com/DataDog/dd-trace-rb/issues/552
[#578]: https://github.com/DataDog/dd-trace-rb/issues/578
[#580]: https://github.com/DataDog/dd-trace-rb/issues/580
[#582]: https://github.com/DataDog/dd-trace-rb/issues/582
[#583]: https://github.com/DataDog/dd-trace-rb/issues/583
[#591]: https://github.com/DataDog/dd-trace-rb/issues/591
[#593]: https://github.com/DataDog/dd-trace-rb/issues/593
[#597]: https://github.com/DataDog/dd-trace-rb/issues/597
[#598]: https://github.com/DataDog/dd-trace-rb/issues/598
[#602]: https://github.com/DataDog/dd-trace-rb/issues/602
[#605]: https://github.com/DataDog/dd-trace-rb/issues/605
[#626]: https://github.com/DataDog/dd-trace-rb/issues/626
[#628]: https://github.com/DataDog/dd-trace-rb/issues/628
[#630]: https://github.com/DataDog/dd-trace-rb/issues/630
[#631]: https://github.com/DataDog/dd-trace-rb/issues/631
[#635]: https://github.com/DataDog/dd-trace-rb/issues/635
[#636]: https://github.com/DataDog/dd-trace-rb/issues/636
[#637]: https://github.com/DataDog/dd-trace-rb/issues/637
[#639]: https://github.com/DataDog/dd-trace-rb/issues/639
[#640]: https://github.com/DataDog/dd-trace-rb/issues/640
[#641]: https://github.com/DataDog/dd-trace-rb/issues/641
[#642]: https://github.com/DataDog/dd-trace-rb/issues/642
[#648]: https://github.com/DataDog/dd-trace-rb/issues/648
[#649]: https://github.com/DataDog/dd-trace-rb/issues/649
[#650]: https://github.com/DataDog/dd-trace-rb/issues/650
[#651]: https://github.com/DataDog/dd-trace-rb/issues/651
[#654]: https://github.com/DataDog/dd-trace-rb/issues/654
[#655]: https://github.com/DataDog/dd-trace-rb/issues/655
[#656]: https://github.com/DataDog/dd-trace-rb/issues/656
[#658]: https://github.com/DataDog/dd-trace-rb/issues/658
[#660]: https://github.com/DataDog/dd-trace-rb/issues/660
[#661]: https://github.com/DataDog/dd-trace-rb/issues/661
[#662]: https://github.com/DataDog/dd-trace-rb/issues/662
[#664]: https://github.com/DataDog/dd-trace-rb/issues/664
[#665]: https://github.com/DataDog/dd-trace-rb/issues/665
[#666]: https://github.com/DataDog/dd-trace-rb/issues/666
[#671]: https://github.com/DataDog/dd-trace-rb/issues/671
[#672]: https://github.com/DataDog/dd-trace-rb/issues/672
[#673]: https://github.com/DataDog/dd-trace-rb/issues/673
[#674]: https://github.com/DataDog/dd-trace-rb/issues/674
[#675]: https://github.com/DataDog/dd-trace-rb/issues/675
[#677]: https://github.com/DataDog/dd-trace-rb/issues/677
[#681]: https://github.com/DataDog/dd-trace-rb/issues/681
[#683]: https://github.com/DataDog/dd-trace-rb/issues/683
[#686]: https://github.com/DataDog/dd-trace-rb/issues/686
[#687]: https://github.com/DataDog/dd-trace-rb/issues/687
[#693]: https://github.com/DataDog/dd-trace-rb/issues/693
[#696]: https://github.com/DataDog/dd-trace-rb/issues/696
[#697]: https://github.com/DataDog/dd-trace-rb/issues/697
[#699]: https://github.com/DataDog/dd-trace-rb/issues/699
[#700]: https://github.com/DataDog/dd-trace-rb/issues/700
[#701]: https://github.com/DataDog/dd-trace-rb/issues/701
[#702]: https://github.com/DataDog/dd-trace-rb/issues/702
[#703]: https://github.com/DataDog/dd-trace-rb/issues/703
[#704]: https://github.com/DataDog/dd-trace-rb/issues/704
[#707]: https://github.com/DataDog/dd-trace-rb/issues/707
[#709]: https://github.com/DataDog/dd-trace-rb/issues/709
[#714]: https://github.com/DataDog/dd-trace-rb/issues/714
[#715]: https://github.com/DataDog/dd-trace-rb/issues/715
[#716]: https://github.com/DataDog/dd-trace-rb/issues/716
[#719]: https://github.com/DataDog/dd-trace-rb/issues/719
[#720]: https://github.com/DataDog/dd-trace-rb/issues/720
[#721]: https://github.com/DataDog/dd-trace-rb/issues/721
[#722]: https://github.com/DataDog/dd-trace-rb/issues/722
[#724]: https://github.com/DataDog/dd-trace-rb/issues/724
[#728]: https://github.com/DataDog/dd-trace-rb/issues/728
[#729]: https://github.com/DataDog/dd-trace-rb/issues/729
[#731]: https://github.com/DataDog/dd-trace-rb/issues/731
[#738]: https://github.com/DataDog/dd-trace-rb/issues/738
[#739]: https://github.com/DataDog/dd-trace-rb/issues/739
[#742]: https://github.com/DataDog/dd-trace-rb/issues/742
[#747]: https://github.com/DataDog/dd-trace-rb/issues/747
[#748]: https://github.com/DataDog/dd-trace-rb/issues/748
[#750]: https://github.com/DataDog/dd-trace-rb/issues/750
[#751]: https://github.com/DataDog/dd-trace-rb/issues/751
[#752]: https://github.com/DataDog/dd-trace-rb/issues/752
[#753]: https://github.com/DataDog/dd-trace-rb/issues/753
[#754]: https://github.com/DataDog/dd-trace-rb/issues/754
[#756]: https://github.com/DataDog/dd-trace-rb/issues/756
[#757]: https://github.com/DataDog/dd-trace-rb/issues/757
[#760]: https://github.com/DataDog/dd-trace-rb/issues/760
[#762]: https://github.com/DataDog/dd-trace-rb/issues/762
[#765]: https://github.com/DataDog/dd-trace-rb/issues/765
[#768]: https://github.com/DataDog/dd-trace-rb/issues/768
[#770]: https://github.com/DataDog/dd-trace-rb/issues/770
[#771]: https://github.com/DataDog/dd-trace-rb/issues/771
[#775]: https://github.com/DataDog/dd-trace-rb/issues/775
[#776]: https://github.com/DataDog/dd-trace-rb/issues/776
[#778]: https://github.com/DataDog/dd-trace-rb/issues/778
[#782]: https://github.com/DataDog/dd-trace-rb/issues/782
[#784]: https://github.com/DataDog/dd-trace-rb/issues/784
[#786]: https://github.com/DataDog/dd-trace-rb/issues/786
[#789]: https://github.com/DataDog/dd-trace-rb/issues/789
[#791]: https://github.com/DataDog/dd-trace-rb/issues/791
[#795]: https://github.com/DataDog/dd-trace-rb/issues/795
[#796]: https://github.com/DataDog/dd-trace-rb/issues/796
[#798]: https://github.com/DataDog/dd-trace-rb/issues/798
[#800]: https://github.com/DataDog/dd-trace-rb/issues/800
[#802]: https://github.com/DataDog/dd-trace-rb/issues/802
[#805]: https://github.com/DataDog/dd-trace-rb/issues/805
[#811]: https://github.com/DataDog/dd-trace-rb/issues/811
[#814]: https://github.com/DataDog/dd-trace-rb/issues/814
[#815]: https://github.com/DataDog/dd-trace-rb/issues/815
[#817]: https://github.com/DataDog/dd-trace-rb/issues/817
[#818]: https://github.com/DataDog/dd-trace-rb/issues/818
[#819]: https://github.com/DataDog/dd-trace-rb/issues/819
[#821]: https://github.com/DataDog/dd-trace-rb/issues/821
[#823]: https://github.com/DataDog/dd-trace-rb/issues/823
[#824]: https://github.com/DataDog/dd-trace-rb/issues/824
[#832]: https://github.com/DataDog/dd-trace-rb/issues/832
[#838]: https://github.com/DataDog/dd-trace-rb/issues/838
[#840]: https://github.com/DataDog/dd-trace-rb/issues/840
[#841]: https://github.com/DataDog/dd-trace-rb/issues/841
[#842]: https://github.com/DataDog/dd-trace-rb/issues/842
[#843]: https://github.com/DataDog/dd-trace-rb/issues/843
[#844]: https://github.com/DataDog/dd-trace-rb/issues/844
[#845]: https://github.com/DataDog/dd-trace-rb/issues/845
[#846]: https://github.com/DataDog/dd-trace-rb/issues/846
[#847]: https://github.com/DataDog/dd-trace-rb/issues/847
[#851]: https://github.com/DataDog/dd-trace-rb/issues/851
[#853]: https://github.com/DataDog/dd-trace-rb/issues/853
[#854]: https://github.com/DataDog/dd-trace-rb/issues/854
[#855]: https://github.com/DataDog/dd-trace-rb/issues/855
[#856]: https://github.com/DataDog/dd-trace-rb/issues/856
[#859]: https://github.com/DataDog/dd-trace-rb/issues/859
[#861]: https://github.com/DataDog/dd-trace-rb/issues/861
[#865]: https://github.com/DataDog/dd-trace-rb/issues/865
[#867]: https://github.com/DataDog/dd-trace-rb/issues/867
[#868]: https://github.com/DataDog/dd-trace-rb/issues/868
[#871]: https://github.com/DataDog/dd-trace-rb/issues/871
[#872]: https://github.com/DataDog/dd-trace-rb/issues/872
[#880]: https://github.com/DataDog/dd-trace-rb/issues/880
[#881]: https://github.com/DataDog/dd-trace-rb/issues/881
[#882]: https://github.com/DataDog/dd-trace-rb/issues/882
[#883]: https://github.com/DataDog/dd-trace-rb/issues/883
[#884]: https://github.com/DataDog/dd-trace-rb/issues/884
[#885]: https://github.com/DataDog/dd-trace-rb/issues/885
[#886]: https://github.com/DataDog/dd-trace-rb/issues/886
[#888]: https://github.com/DataDog/dd-trace-rb/issues/888
[#890]: https://github.com/DataDog/dd-trace-rb/issues/890
[#891]: https://github.com/DataDog/dd-trace-rb/issues/891
[#892]: https://github.com/DataDog/dd-trace-rb/issues/892
[#893]: https://github.com/DataDog/dd-trace-rb/issues/893
[#894]: https://github.com/DataDog/dd-trace-rb/issues/894
[#895]: https://github.com/DataDog/dd-trace-rb/issues/895
[#896]: https://github.com/DataDog/dd-trace-rb/issues/896
[#898]: https://github.com/DataDog/dd-trace-rb/issues/898
[#899]: https://github.com/DataDog/dd-trace-rb/issues/899
[#900]: https://github.com/DataDog/dd-trace-rb/issues/900
[#903]: https://github.com/DataDog/dd-trace-rb/issues/903
[#904]: https://github.com/DataDog/dd-trace-rb/issues/904
[#906]: https://github.com/DataDog/dd-trace-rb/issues/906
[#907]: https://github.com/DataDog/dd-trace-rb/issues/907
[#909]: https://github.com/DataDog/dd-trace-rb/issues/909
[#910]: https://github.com/DataDog/dd-trace-rb/issues/910
[#911]: https://github.com/DataDog/dd-trace-rb/issues/911
[#912]: https://github.com/DataDog/dd-trace-rb/issues/912
[#913]: https://github.com/DataDog/dd-trace-rb/issues/913
[#914]: https://github.com/DataDog/dd-trace-rb/issues/914
[#915]: https://github.com/DataDog/dd-trace-rb/issues/915
[#917]: https://github.com/DataDog/dd-trace-rb/issues/917
[#918]: https://github.com/DataDog/dd-trace-rb/issues/918
[#919]: https://github.com/DataDog/dd-trace-rb/issues/919
[#920]: https://github.com/DataDog/dd-trace-rb/issues/920
[#921]: https://github.com/DataDog/dd-trace-rb/issues/921
[#927]: https://github.com/DataDog/dd-trace-rb/issues/927
[#928]: https://github.com/DataDog/dd-trace-rb/issues/928
[#929]: https://github.com/DataDog/dd-trace-rb/issues/929
[#930]: https://github.com/DataDog/dd-trace-rb/issues/930
[#932]: https://github.com/DataDog/dd-trace-rb/issues/932
[#933]: https://github.com/DataDog/dd-trace-rb/issues/933
[#934]: https://github.com/DataDog/dd-trace-rb/issues/934
[#935]: https://github.com/DataDog/dd-trace-rb/issues/935
[#937]: https://github.com/DataDog/dd-trace-rb/issues/937
[#938]: https://github.com/DataDog/dd-trace-rb/issues/938
[#940]: https://github.com/DataDog/dd-trace-rb/issues/940
[#942]: https://github.com/DataDog/dd-trace-rb/issues/942
[#943]: https://github.com/DataDog/dd-trace-rb/issues/943
[#944]: https://github.com/DataDog/dd-trace-rb/issues/944
[#945]: https://github.com/DataDog/dd-trace-rb/issues/945
[#947]: https://github.com/DataDog/dd-trace-rb/issues/947
[#948]: https://github.com/DataDog/dd-trace-rb/issues/948
[#949]: https://github.com/DataDog/dd-trace-rb/issues/949
[#950]: https://github.com/DataDog/dd-trace-rb/issues/950
[#951]: https://github.com/DataDog/dd-trace-rb/issues/951
[#952]: https://github.com/DataDog/dd-trace-rb/issues/952
[#953]: https://github.com/DataDog/dd-trace-rb/issues/953
[#954]: https://github.com/DataDog/dd-trace-rb/issues/954
[#955]: https://github.com/DataDog/dd-trace-rb/issues/955
[#956]: https://github.com/DataDog/dd-trace-rb/issues/956
[#957]: https://github.com/DataDog/dd-trace-rb/issues/957
[#960]: https://github.com/DataDog/dd-trace-rb/issues/960
[#961]: https://github.com/DataDog/dd-trace-rb/issues/961
[#964]: https://github.com/DataDog/dd-trace-rb/issues/964
[#965]: https://github.com/DataDog/dd-trace-rb/issues/965
[#966]: https://github.com/DataDog/dd-trace-rb/issues/966
[#967]: https://github.com/DataDog/dd-trace-rb/issues/967
[#968]: https://github.com/DataDog/dd-trace-rb/issues/968
[#969]: https://github.com/DataDog/dd-trace-rb/issues/969
[#971]: https://github.com/DataDog/dd-trace-rb/issues/971
[#972]: https://github.com/DataDog/dd-trace-rb/issues/972
[#973]: https://github.com/DataDog/dd-trace-rb/issues/973
[#974]: https://github.com/DataDog/dd-trace-rb/issues/974
[#975]: https://github.com/DataDog/dd-trace-rb/issues/975
[#977]: https://github.com/DataDog/dd-trace-rb/issues/977
[#980]: https://github.com/DataDog/dd-trace-rb/issues/980
[#981]: https://github.com/DataDog/dd-trace-rb/issues/981
[#982]: https://github.com/DataDog/dd-trace-rb/issues/982
[#983]: https://github.com/DataDog/dd-trace-rb/issues/983
[#985]: https://github.com/DataDog/dd-trace-rb/issues/985
[#986]: https://github.com/DataDog/dd-trace-rb/issues/986
[#988]: https://github.com/DataDog/dd-trace-rb/issues/988
[#989]: https://github.com/DataDog/dd-trace-rb/issues/989
[#990]: https://github.com/DataDog/dd-trace-rb/issues/990
[#991]: https://github.com/DataDog/dd-trace-rb/issues/991
[#993]: https://github.com/DataDog/dd-trace-rb/issues/993
[#995]: https://github.com/DataDog/dd-trace-rb/issues/995
[#996]: https://github.com/DataDog/dd-trace-rb/issues/996
[#997]: https://github.com/DataDog/dd-trace-rb/issues/997
[#1000]: https://github.com/DataDog/dd-trace-rb/issues/1000
[#1004]: https://github.com/DataDog/dd-trace-rb/issues/1004
[#1005]: https://github.com/DataDog/dd-trace-rb/issues/1005
[#1006]: https://github.com/DataDog/dd-trace-rb/issues/1006
[#1008]: https://github.com/DataDog/dd-trace-rb/issues/1008
[#1009]: https://github.com/DataDog/dd-trace-rb/issues/1009
[#1010]: https://github.com/DataDog/dd-trace-rb/issues/1010
[#1015]: https://github.com/DataDog/dd-trace-rb/issues/1015
[#1021]: https://github.com/DataDog/dd-trace-rb/issues/1021
[#1023]: https://github.com/DataDog/dd-trace-rb/issues/1023
[#1027]: https://github.com/DataDog/dd-trace-rb/issues/1027
[#1030]: https://github.com/DataDog/dd-trace-rb/issues/1030
[#1031]: https://github.com/DataDog/dd-trace-rb/issues/1031
[#1032]: https://github.com/DataDog/dd-trace-rb/issues/1032
[#1033]: https://github.com/DataDog/dd-trace-rb/issues/1033
[#1034]: https://github.com/DataDog/dd-trace-rb/issues/1034
[#1035]: https://github.com/DataDog/dd-trace-rb/issues/1035
[#1037]: https://github.com/DataDog/dd-trace-rb/issues/1037
[#1041]: https://github.com/DataDog/dd-trace-rb/issues/1041
[#1043]: https://github.com/DataDog/dd-trace-rb/issues/1043
[#1045]: https://github.com/DataDog/dd-trace-rb/issues/1045
[#1046]: https://github.com/DataDog/dd-trace-rb/issues/1046
[#1047]: https://github.com/DataDog/dd-trace-rb/issues/1047
[#1051]: https://github.com/DataDog/dd-trace-rb/issues/1051
[#1054]: https://github.com/DataDog/dd-trace-rb/issues/1054
[#1057]: https://github.com/DataDog/dd-trace-rb/issues/1057
[#1062]: https://github.com/DataDog/dd-trace-rb/issues/1062
[#1070]: https://github.com/DataDog/dd-trace-rb/issues/1070
[#1071]: https://github.com/DataDog/dd-trace-rb/issues/1071
[#1072]: https://github.com/DataDog/dd-trace-rb/issues/1072
[#1073]: https://github.com/DataDog/dd-trace-rb/issues/1073
[#1074]: https://github.com/DataDog/dd-trace-rb/issues/1074
[#1075]: https://github.com/DataDog/dd-trace-rb/issues/1075
[#1076]: https://github.com/DataDog/dd-trace-rb/issues/1076
[#1079]: https://github.com/DataDog/dd-trace-rb/issues/1079
[#1081]: https://github.com/DataDog/dd-trace-rb/issues/1081
[#1082]: https://github.com/DataDog/dd-trace-rb/issues/1082
[#1086]: https://github.com/DataDog/dd-trace-rb/issues/1086
[#1089]: https://github.com/DataDog/dd-trace-rb/issues/1089
[#1090]: https://github.com/DataDog/dd-trace-rb/issues/1090
[#1091]: https://github.com/DataDog/dd-trace-rb/issues/1091
[#1092]: https://github.com/DataDog/dd-trace-rb/issues/1092
[#1099]: https://github.com/DataDog/dd-trace-rb/issues/1099
[#1100]: https://github.com/DataDog/dd-trace-rb/issues/1100
[#1103]: https://github.com/DataDog/dd-trace-rb/issues/1103
[#1104]: https://github.com/DataDog/dd-trace-rb/issues/1104
[#1105]: https://github.com/DataDog/dd-trace-rb/issues/1105
[#1107]: https://github.com/DataDog/dd-trace-rb/issues/1107
[#1109]: https://github.com/DataDog/dd-trace-rb/issues/1109
[#1115]: https://github.com/DataDog/dd-trace-rb/issues/1115
[#1116]: https://github.com/DataDog/dd-trace-rb/issues/1116
[#1118]: https://github.com/DataDog/dd-trace-rb/issues/1118
[#1119]: https://github.com/DataDog/dd-trace-rb/issues/1119
[#1120]: https://github.com/DataDog/dd-trace-rb/issues/1120
[#1121]: https://github.com/DataDog/dd-trace-rb/issues/1121
[#1122]: https://github.com/DataDog/dd-trace-rb/issues/1122
[#1124]: https://github.com/DataDog/dd-trace-rb/issues/1124
[#1125]: https://github.com/DataDog/dd-trace-rb/issues/1125
[#1126]: https://github.com/DataDog/dd-trace-rb/issues/1126
[#1127]: https://github.com/DataDog/dd-trace-rb/issues/1127
[#1128]: https://github.com/DataDog/dd-trace-rb/issues/1128
[#1129]: https://github.com/DataDog/dd-trace-rb/issues/1129
[#1131]: https://github.com/DataDog/dd-trace-rb/issues/1131
[#1133]: https://github.com/DataDog/dd-trace-rb/issues/1133
[#1134]: https://github.com/DataDog/dd-trace-rb/issues/1134
[#1137]: https://github.com/DataDog/dd-trace-rb/issues/1137
[#1138]: https://github.com/DataDog/dd-trace-rb/issues/1138
[#1141]: https://github.com/DataDog/dd-trace-rb/issues/1141
[#1145]: https://github.com/DataDog/dd-trace-rb/issues/1145
[#1146]: https://github.com/DataDog/dd-trace-rb/issues/1146
[#1148]: https://github.com/DataDog/dd-trace-rb/issues/1148
[#1149]: https://github.com/DataDog/dd-trace-rb/issues/1149
[#1150]: https://github.com/DataDog/dd-trace-rb/issues/1150
[#1151]: https://github.com/DataDog/dd-trace-rb/issues/1151
[#1152]: https://github.com/DataDog/dd-trace-rb/issues/1152
[#1153]: https://github.com/DataDog/dd-trace-rb/issues/1153
[#1154]: https://github.com/DataDog/dd-trace-rb/issues/1154
[#1155]: https://github.com/DataDog/dd-trace-rb/issues/1155
[#1156]: https://github.com/DataDog/dd-trace-rb/issues/1156
[#1157]: https://github.com/DataDog/dd-trace-rb/issues/1157
[#1158]: https://github.com/DataDog/dd-trace-rb/issues/1158
[#1159]: https://github.com/DataDog/dd-trace-rb/issues/1159
[#1160]: https://github.com/DataDog/dd-trace-rb/issues/1160
[#1162]: https://github.com/DataDog/dd-trace-rb/issues/1162
[#1163]: https://github.com/DataDog/dd-trace-rb/issues/1163
[#1165]: https://github.com/DataDog/dd-trace-rb/issues/1165
[#1172]: https://github.com/DataDog/dd-trace-rb/issues/1172
[#1173]: https://github.com/DataDog/dd-trace-rb/issues/1173
[#1176]: https://github.com/DataDog/dd-trace-rb/issues/1176
[#1177]: https://github.com/DataDog/dd-trace-rb/issues/1177
[#1178]: https://github.com/DataDog/dd-trace-rb/issues/1178
[#1179]: https://github.com/DataDog/dd-trace-rb/issues/1179
[#1180]: https://github.com/DataDog/dd-trace-rb/issues/1180
[#1181]: https://github.com/DataDog/dd-trace-rb/issues/1181
[#1182]: https://github.com/DataDog/dd-trace-rb/issues/1182
[#1183]: https://github.com/DataDog/dd-trace-rb/issues/1183
[#1184]: https://github.com/DataDog/dd-trace-rb/issues/1184
[#1185]: https://github.com/DataDog/dd-trace-rb/issues/1185
[#1186]: https://github.com/DataDog/dd-trace-rb/issues/1186
[#1187]: https://github.com/DataDog/dd-trace-rb/issues/1187
[#1188]: https://github.com/DataDog/dd-trace-rb/issues/1188
[#1189]: https://github.com/DataDog/dd-trace-rb/issues/1189
[#1195]: https://github.com/DataDog/dd-trace-rb/issues/1195
[#1198]: https://github.com/DataDog/dd-trace-rb/issues/1198
[#1199]: https://github.com/DataDog/dd-trace-rb/issues/1199
[#1200]: https://github.com/DataDog/dd-trace-rb/issues/1200
[#1203]: https://github.com/DataDog/dd-trace-rb/issues/1203
[#1204]: https://github.com/DataDog/dd-trace-rb/issues/1204
[#1210]: https://github.com/DataDog/dd-trace-rb/issues/1210
[#1212]: https://github.com/DataDog/dd-trace-rb/issues/1212
[#1213]: https://github.com/DataDog/dd-trace-rb/issues/1213
[#1216]: https://github.com/DataDog/dd-trace-rb/issues/1216
[#1217]: https://github.com/DataDog/dd-trace-rb/issues/1217
[#1218]: https://github.com/DataDog/dd-trace-rb/issues/1218
[#1220]: https://github.com/DataDog/dd-trace-rb/issues/1220
[#1224]: https://github.com/DataDog/dd-trace-rb/issues/1224
[#1225]: https://github.com/DataDog/dd-trace-rb/issues/1225
[#1226]: https://github.com/DataDog/dd-trace-rb/issues/1226
[#1227]: https://github.com/DataDog/dd-trace-rb/issues/1227
[#1229]: https://github.com/DataDog/dd-trace-rb/issues/1229
[#1232]: https://github.com/DataDog/dd-trace-rb/issues/1232
[#1233]: https://github.com/DataDog/dd-trace-rb/issues/1233
[#1234]: https://github.com/DataDog/dd-trace-rb/issues/1234
[#1235]: https://github.com/DataDog/dd-trace-rb/issues/1235
[#1236]: https://github.com/DataDog/dd-trace-rb/issues/1236
[#1237]: https://github.com/DataDog/dd-trace-rb/issues/1237
[#1238]: https://github.com/DataDog/dd-trace-rb/issues/1238
[#1239]: https://github.com/DataDog/dd-trace-rb/issues/1239
[#1243]: https://github.com/DataDog/dd-trace-rb/issues/1243
[#1244]: https://github.com/DataDog/dd-trace-rb/issues/1244
[#1248]: https://github.com/DataDog/dd-trace-rb/issues/1248
[#1256]: https://github.com/DataDog/dd-trace-rb/issues/1256
[#1257]: https://github.com/DataDog/dd-trace-rb/issues/1257
[#1260]: https://github.com/DataDog/dd-trace-rb/issues/1260
[#1262]: https://github.com/DataDog/dd-trace-rb/issues/1262
[#1263]: https://github.com/DataDog/dd-trace-rb/issues/1263
[#1264]: https://github.com/DataDog/dd-trace-rb/issues/1264
[#1266]: https://github.com/DataDog/dd-trace-rb/issues/1266
[#1267]: https://github.com/DataDog/dd-trace-rb/issues/1267
[#1268]: https://github.com/DataDog/dd-trace-rb/issues/1268
[#1269]: https://github.com/DataDog/dd-trace-rb/issues/1269
[#1270]: https://github.com/DataDog/dd-trace-rb/issues/1270
[#1272]: https://github.com/DataDog/dd-trace-rb/issues/1272
[#1273]: https://github.com/DataDog/dd-trace-rb/issues/1273
[#1275]: https://github.com/DataDog/dd-trace-rb/issues/1275
[#1276]: https://github.com/DataDog/dd-trace-rb/issues/1276
[#1277]: https://github.com/DataDog/dd-trace-rb/issues/1277
[#1278]: https://github.com/DataDog/dd-trace-rb/issues/1278
[#1279]: https://github.com/DataDog/dd-trace-rb/issues/1279
[#1280]: https://github.com/DataDog/dd-trace-rb/issues/1280
[#1281]: https://github.com/DataDog/dd-trace-rb/issues/1281
[#1283]: https://github.com/DataDog/dd-trace-rb/issues/1283
[#1284]: https://github.com/DataDog/dd-trace-rb/issues/1284
[#1286]: https://github.com/DataDog/dd-trace-rb/issues/1286
[#1287]: https://github.com/DataDog/dd-trace-rb/issues/1287
[#1289]: https://github.com/DataDog/dd-trace-rb/issues/1289
[#1291]: https://github.com/DataDog/dd-trace-rb/issues/1291
[#1293]: https://github.com/DataDog/dd-trace-rb/issues/1293
[#1295]: https://github.com/DataDog/dd-trace-rb/issues/1295
[#1296]: https://github.com/DataDog/dd-trace-rb/issues/1296
[#1297]: https://github.com/DataDog/dd-trace-rb/issues/1297
[#1298]: https://github.com/DataDog/dd-trace-rb/issues/1298
[#1299]: https://github.com/DataDog/dd-trace-rb/issues/1299
[#1302]: https://github.com/DataDog/dd-trace-rb/issues/1302
[#1303]: https://github.com/DataDog/dd-trace-rb/issues/1303
[#1304]: https://github.com/DataDog/dd-trace-rb/issues/1304
[#1305]: https://github.com/DataDog/dd-trace-rb/issues/1305
[#1306]: https://github.com/DataDog/dd-trace-rb/issues/1306
[#1307]: https://github.com/DataDog/dd-trace-rb/issues/1307
[#1309]: https://github.com/DataDog/dd-trace-rb/issues/1309
[#1311]: https://github.com/DataDog/dd-trace-rb/issues/1311
[#1317]: https://github.com/DataDog/dd-trace-rb/issues/1317
[#1318]: https://github.com/DataDog/dd-trace-rb/issues/1318
[#1319]: https://github.com/DataDog/dd-trace-rb/issues/1319
[#1320]: https://github.com/DataDog/dd-trace-rb/issues/1320
[#1321]: https://github.com/DataDog/dd-trace-rb/issues/1321
[#1323]: https://github.com/DataDog/dd-trace-rb/issues/1323
[#1325]: https://github.com/DataDog/dd-trace-rb/issues/1325
[#1326]: https://github.com/DataDog/dd-trace-rb/issues/1326
[#1331]: https://github.com/DataDog/dd-trace-rb/issues/1331
[#1332]: https://github.com/DataDog/dd-trace-rb/issues/1332
[#1334]: https://github.com/DataDog/dd-trace-rb/issues/1334
[#1336]: https://github.com/DataDog/dd-trace-rb/issues/1336
[#1341]: https://github.com/DataDog/dd-trace-rb/issues/1341
[#1342]: https://github.com/DataDog/dd-trace-rb/issues/1342
[#1343]: https://github.com/DataDog/dd-trace-rb/issues/1343
[#1346]: https://github.com/DataDog/dd-trace-rb/issues/1346
[#1347]: https://github.com/DataDog/dd-trace-rb/issues/1347
[#1350]: https://github.com/DataDog/dd-trace-rb/issues/1350
[#1352]: https://github.com/DataDog/dd-trace-rb/issues/1352
[#1353]: https://github.com/DataDog/dd-trace-rb/issues/1353
[#1354]: https://github.com/DataDog/dd-trace-rb/issues/1354
[#1357]: https://github.com/DataDog/dd-trace-rb/issues/1357
[#1365]: https://github.com/DataDog/dd-trace-rb/issues/1365
[#1366]: https://github.com/DataDog/dd-trace-rb/issues/1366
[#1367]: https://github.com/DataDog/dd-trace-rb/issues/1367
[#1368]: https://github.com/DataDog/dd-trace-rb/issues/1368
[#1369]: https://github.com/DataDog/dd-trace-rb/issues/1369
[#1370]: https://github.com/DataDog/dd-trace-rb/issues/1370
[#1371]: https://github.com/DataDog/dd-trace-rb/issues/1371
[#1374]: https://github.com/DataDog/dd-trace-rb/issues/1374
[#1377]: https://github.com/DataDog/dd-trace-rb/issues/1377
[#1378]: https://github.com/DataDog/dd-trace-rb/issues/1378
[#1379]: https://github.com/DataDog/dd-trace-rb/issues/1379
[#1380]: https://github.com/DataDog/dd-trace-rb/issues/1380
[#1381]: https://github.com/DataDog/dd-trace-rb/issues/1381
[#1393]: https://github.com/DataDog/dd-trace-rb/issues/1393
[#1394]: https://github.com/DataDog/dd-trace-rb/issues/1394
[#1396]: https://github.com/DataDog/dd-trace-rb/issues/1396
[#1397]: https://github.com/DataDog/dd-trace-rb/issues/1397
[#1398]: https://github.com/DataDog/dd-trace-rb/issues/1398
[#1399]: https://github.com/DataDog/dd-trace-rb/issues/1399
[#1400]: https://github.com/DataDog/dd-trace-rb/issues/1400
[#1403]: https://github.com/DataDog/dd-trace-rb/issues/1403
[#1406]: https://github.com/DataDog/dd-trace-rb/issues/1406
[#1408]: https://github.com/DataDog/dd-trace-rb/issues/1408
[#1409]: https://github.com/DataDog/dd-trace-rb/issues/1409
[#1412]: https://github.com/DataDog/dd-trace-rb/issues/1412
[#1414]: https://github.com/DataDog/dd-trace-rb/issues/1414
[#1415]: https://github.com/DataDog/dd-trace-rb/issues/1415
[#1416]: https://github.com/DataDog/dd-trace-rb/issues/1416
[#1417]: https://github.com/DataDog/dd-trace-rb/issues/1417
[#1418]: https://github.com/DataDog/dd-trace-rb/issues/1418
[#1419]: https://github.com/DataDog/dd-trace-rb/issues/1419
[#1420]: https://github.com/DataDog/dd-trace-rb/issues/1420
[#1421]: https://github.com/DataDog/dd-trace-rb/issues/1421
[#1422]: https://github.com/DataDog/dd-trace-rb/issues/1422
[#1423]: https://github.com/DataDog/dd-trace-rb/issues/1423
[#1426]: https://github.com/DataDog/dd-trace-rb/issues/1426
[#1427]: https://github.com/DataDog/dd-trace-rb/issues/1427
[#1428]: https://github.com/DataDog/dd-trace-rb/issues/1428
[#1429]: https://github.com/DataDog/dd-trace-rb/issues/1429
[#1430]: https://github.com/DataDog/dd-trace-rb/issues/1430
[#1431]: https://github.com/DataDog/dd-trace-rb/issues/1431
[#1432]: https://github.com/DataDog/dd-trace-rb/issues/1432
[#1435]: https://github.com/DataDog/dd-trace-rb/issues/1435
[#1441]: https://github.com/DataDog/dd-trace-rb/issues/1441
[#1445]: https://github.com/DataDog/dd-trace-rb/issues/1445
[#1447]: https://github.com/DataDog/dd-trace-rb/issues/1447
[#1449]: https://github.com/DataDog/dd-trace-rb/issues/1449
[#1453]: https://github.com/DataDog/dd-trace-rb/issues/1453
[#1455]: https://github.com/DataDog/dd-trace-rb/issues/1455
[#1456]: https://github.com/DataDog/dd-trace-rb/issues/1456
[#1457]: https://github.com/DataDog/dd-trace-rb/issues/1457
[#1461]: https://github.com/DataDog/dd-trace-rb/issues/1461
[#1472]: https://github.com/DataDog/dd-trace-rb/issues/1472
[#1473]: https://github.com/DataDog/dd-trace-rb/issues/1473
[#1475]: https://github.com/DataDog/dd-trace-rb/issues/1475
[#1480]: https://github.com/DataDog/dd-trace-rb/issues/1480
[#1487]: https://github.com/DataDog/dd-trace-rb/issues/1487
[#1489]: https://github.com/DataDog/dd-trace-rb/issues/1489
[#1494]: https://github.com/DataDog/dd-trace-rb/issues/1494
[#1495]: https://github.com/DataDog/dd-trace-rb/issues/1495
[#1497]: https://github.com/DataDog/dd-trace-rb/issues/1497
[#1500]: https://github.com/DataDog/dd-trace-rb/issues/1500
[#1502]: https://github.com/DataDog/dd-trace-rb/issues/1502
[#1503]: https://github.com/DataDog/dd-trace-rb/issues/1503
[#1504]: https://github.com/DataDog/dd-trace-rb/issues/1504
[#1506]: https://github.com/DataDog/dd-trace-rb/issues/1506
[#1507]: https://github.com/DataDog/dd-trace-rb/issues/1507
[#1509]: https://github.com/DataDog/dd-trace-rb/issues/1509
[#1510]: https://github.com/DataDog/dd-trace-rb/issues/1510
[#1511]: https://github.com/DataDog/dd-trace-rb/issues/1511
[#1523]: https://github.com/DataDog/dd-trace-rb/issues/1523
[#1524]: https://github.com/DataDog/dd-trace-rb/issues/1524
[#1529]: https://github.com/DataDog/dd-trace-rb/issues/1529
[#1533]: https://github.com/DataDog/dd-trace-rb/issues/1533
[#1534]: https://github.com/DataDog/dd-trace-rb/issues/1534
[#1535]: https://github.com/DataDog/dd-trace-rb/issues/1535
[#1537]: https://github.com/DataDog/dd-trace-rb/issues/1537
[#1543]: https://github.com/DataDog/dd-trace-rb/issues/1543
[#1544]: https://github.com/DataDog/dd-trace-rb/issues/1544
[#1552]: https://github.com/DataDog/dd-trace-rb/issues/1552
[#1555]: https://github.com/DataDog/dd-trace-rb/issues/1555
[#1556]: https://github.com/DataDog/dd-trace-rb/issues/1556
[#1557]: https://github.com/DataDog/dd-trace-rb/issues/1557
[#1560]: https://github.com/DataDog/dd-trace-rb/issues/1560
[#1561]: https://github.com/DataDog/dd-trace-rb/issues/1561
[#1566]: https://github.com/DataDog/dd-trace-rb/issues/1566
[#1570]: https://github.com/DataDog/dd-trace-rb/issues/1570
[#1572]: https://github.com/DataDog/dd-trace-rb/issues/1572
[#1576]: https://github.com/DataDog/dd-trace-rb/issues/1576
[#1583]: https://github.com/DataDog/dd-trace-rb/issues/1583
[#1584]: https://github.com/DataDog/dd-trace-rb/issues/1584
[#1585]: https://github.com/DataDog/dd-trace-rb/issues/1585
[#1586]: https://github.com/DataDog/dd-trace-rb/issues/1586
[#1587]: https://github.com/DataDog/dd-trace-rb/issues/1587
[#1590]: https://github.com/DataDog/dd-trace-rb/issues/1590
[#1592]: https://github.com/DataDog/dd-trace-rb/issues/1592
[#1594]: https://github.com/DataDog/dd-trace-rb/issues/1594
[#1595]: https://github.com/DataDog/dd-trace-rb/issues/1595
[#1601]: https://github.com/DataDog/dd-trace-rb/issues/1601
[#1607]: https://github.com/DataDog/dd-trace-rb/issues/1607
[#1622]: https://github.com/DataDog/dd-trace-rb/issues/1622
[#1623]: https://github.com/DataDog/dd-trace-rb/issues/1623
[#1626]: https://github.com/DataDog/dd-trace-rb/issues/1626
[#1628]: https://github.com/DataDog/dd-trace-rb/issues/1628
[#1629]: https://github.com/DataDog/dd-trace-rb/issues/1629
[#1630]: https://github.com/DataDog/dd-trace-rb/issues/1630
[#1632]: https://github.com/DataDog/dd-trace-rb/issues/1632
[#1636]: https://github.com/DataDog/dd-trace-rb/issues/1636
[#1639]: https://github.com/DataDog/dd-trace-rb/issues/1639
[#1643]: https://github.com/DataDog/dd-trace-rb/issues/1643
[#1644]: https://github.com/DataDog/dd-trace-rb/issues/1644
[#1654]: https://github.com/DataDog/dd-trace-rb/issues/1654
[#1661]: https://github.com/DataDog/dd-trace-rb/issues/1661
[#1662]: https://github.com/DataDog/dd-trace-rb/issues/1662
[#1668]: https://github.com/DataDog/dd-trace-rb/issues/1668
[#1674]: https://github.com/DataDog/dd-trace-rb/issues/1674
[#1680]: https://github.com/DataDog/dd-trace-rb/issues/1680
[#1684]: https://github.com/DataDog/dd-trace-rb/issues/1684
[#1685]: https://github.com/DataDog/dd-trace-rb/issues/1685
[#1687]: https://github.com/DataDog/dd-trace-rb/issues/1687
[#1688]: https://github.com/DataDog/dd-trace-rb/issues/1688
[#1694]: https://github.com/DataDog/dd-trace-rb/issues/1694
[#1695]: https://github.com/DataDog/dd-trace-rb/issues/1695
[#1699]: https://github.com/DataDog/dd-trace-rb/issues/1699
[#1700]: https://github.com/DataDog/dd-trace-rb/issues/1700
[#1702]: https://github.com/DataDog/dd-trace-rb/issues/1702
[#1703]: https://github.com/DataDog/dd-trace-rb/issues/1703
[#1706]: https://github.com/DataDog/dd-trace-rb/issues/1706
[#1709]: https://github.com/DataDog/dd-trace-rb/issues/1709
[#1712]: https://github.com/DataDog/dd-trace-rb/issues/1712
[#1713]: https://github.com/DataDog/dd-trace-rb/issues/1713
[#1714]: https://github.com/DataDog/dd-trace-rb/issues/1714
[#1715]: https://github.com/DataDog/dd-trace-rb/issues/1715
[#1717]: https://github.com/DataDog/dd-trace-rb/issues/1717
[#1718]: https://github.com/DataDog/dd-trace-rb/issues/1718
[#1719]: https://github.com/DataDog/dd-trace-rb/issues/1719
[#1720]: https://github.com/DataDog/dd-trace-rb/issues/1720
[#1721]: https://github.com/DataDog/dd-trace-rb/issues/1721
[#1735]: https://github.com/DataDog/dd-trace-rb/issues/1735
[#1740]: https://github.com/DataDog/dd-trace-rb/issues/1740
[#1743]: https://github.com/DataDog/dd-trace-rb/issues/1743
[#1745]: https://github.com/DataDog/dd-trace-rb/issues/1745
[#1761]: https://github.com/DataDog/dd-trace-rb/issues/1761
[#1762]: https://github.com/DataDog/dd-trace-rb/issues/1762
[#1763]: https://github.com/DataDog/dd-trace-rb/issues/1763
[#1769]: https://github.com/DataDog/dd-trace-rb/issues/1769
[#1770]: https://github.com/DataDog/dd-trace-rb/issues/1770
[#1771]: https://github.com/DataDog/dd-trace-rb/issues/1771
[#1774]: https://github.com/DataDog/dd-trace-rb/issues/1774
[#1776]: https://github.com/DataDog/dd-trace-rb/issues/1776
[#1798]: https://github.com/DataDog/dd-trace-rb/issues/1798
[#1801]: https://github.com/DataDog/dd-trace-rb/issues/1801
[#1807]: https://github.com/DataDog/dd-trace-rb/issues/1807
[#1816]: https://github.com/DataDog/dd-trace-rb/issues/1816
[#1820]: https://github.com/DataDog/dd-trace-rb/issues/1820
[#1829]: https://github.com/DataDog/dd-trace-rb/issues/1829
[#1911]: https://github.com/DataDog/dd-trace-rb/issues/1911
[#1914]: https://github.com/DataDog/dd-trace-rb/issues/1914
[#1917]: https://github.com/DataDog/dd-trace-rb/issues/1917
[#1919]: https://github.com/DataDog/dd-trace-rb/issues/1919
[#1922]: https://github.com/DataDog/dd-trace-rb/issues/1922
[#1927]: https://github.com/DataDog/dd-trace-rb/issues/1927
[#1930]: https://github.com/DataDog/dd-trace-rb/issues/1930
[#1931]: https://github.com/DataDog/dd-trace-rb/issues/1931
[#1932]: https://github.com/DataDog/dd-trace-rb/issues/1932
[#1933]: https://github.com/DataDog/dd-trace-rb/issues/1933
[#1937]: https://github.com/DataDog/dd-trace-rb/issues/1937
[#1938]: https://github.com/DataDog/dd-trace-rb/issues/1938
[#1939]: https://github.com/DataDog/dd-trace-rb/issues/1939
[#1940]: https://github.com/DataDog/dd-trace-rb/issues/1940
[#1942]: https://github.com/DataDog/dd-trace-rb/issues/1942
[#1943]: https://github.com/DataDog/dd-trace-rb/issues/1943
[#1945]: https://github.com/DataDog/dd-trace-rb/issues/1945
[#1948]: https://github.com/DataDog/dd-trace-rb/issues/1948
[#1955]: https://github.com/DataDog/dd-trace-rb/issues/1955
[#1956]: https://github.com/DataDog/dd-trace-rb/issues/1956
[#1958]: https://github.com/DataDog/dd-trace-rb/issues/1958
[#1959]: https://github.com/DataDog/dd-trace-rb/issues/1959
[#1961]: https://github.com/DataDog/dd-trace-rb/issues/1961
[#1964]: https://github.com/DataDog/dd-trace-rb/issues/1964
[#1965]: https://github.com/DataDog/dd-trace-rb/issues/1965
[#1968]: https://github.com/DataDog/dd-trace-rb/issues/1968
[#1970]: https://github.com/DataDog/dd-trace-rb/issues/1970
[#1972]: https://github.com/DataDog/dd-trace-rb/issues/1972
[#1973]: https://github.com/DataDog/dd-trace-rb/issues/1973
[#1974]: https://github.com/DataDog/dd-trace-rb/issues/1974
[#1975]: https://github.com/DataDog/dd-trace-rb/issues/1975
[#1976]: https://github.com/DataDog/dd-trace-rb/issues/1976
[#1980]: https://github.com/DataDog/dd-trace-rb/issues/1980
[#1981]: https://github.com/DataDog/dd-trace-rb/issues/1981
[#1982]: https://github.com/DataDog/dd-trace-rb/issues/1982
[#1983]: https://github.com/DataDog/dd-trace-rb/issues/1983
[#1984]: https://github.com/DataDog/dd-trace-rb/issues/1984
[#1985]: https://github.com/DataDog/dd-trace-rb/issues/1985
[#1989]: https://github.com/DataDog/dd-trace-rb/issues/1989
[#1990]: https://github.com/DataDog/dd-trace-rb/issues/1990
[#1991]: https://github.com/DataDog/dd-trace-rb/issues/1991
[#1992]: https://github.com/DataDog/dd-trace-rb/issues/1992
[#1998]: https://github.com/DataDog/dd-trace-rb/issues/1998
[#2010]: https://github.com/DataDog/dd-trace-rb/issues/2010
[#2011]: https://github.com/DataDog/dd-trace-rb/issues/2011
[#2022]: https://github.com/DataDog/dd-trace-rb/issues/2022
[#2027]: https://github.com/DataDog/dd-trace-rb/issues/2027
[#2028]: https://github.com/DataDog/dd-trace-rb/issues/2028
[#2054]: https://github.com/DataDog/dd-trace-rb/issues/2054
[#2059]: https://github.com/DataDog/dd-trace-rb/issues/2059
[#2061]: https://github.com/DataDog/dd-trace-rb/issues/2061
[#2066]: https://github.com/DataDog/dd-trace-rb/issues/2066
[#2069]: https://github.com/DataDog/dd-trace-rb/issues/2069
[#2070]: https://github.com/DataDog/dd-trace-rb/issues/2070
[#2074]: https://github.com/DataDog/dd-trace-rb/issues/2074
[#2076]: https://github.com/DataDog/dd-trace-rb/issues/2076
[#2079]: https://github.com/DataDog/dd-trace-rb/issues/2079
[#2082]: https://github.com/DataDog/dd-trace-rb/issues/2082
[#2096]: https://github.com/DataDog/dd-trace-rb/issues/2096
[#2097]: https://github.com/DataDog/dd-trace-rb/issues/2097
[#2101]: https://github.com/DataDog/dd-trace-rb/issues/2101
[#2110]: https://github.com/DataDog/dd-trace-rb/issues/2110
[#2113]: https://github.com/DataDog/dd-trace-rb/issues/2113
[#2118]: https://github.com/DataDog/dd-trace-rb/issues/2118
[#2125]: https://github.com/DataDog/dd-trace-rb/issues/2125
[#2128]: https://github.com/DataDog/dd-trace-rb/issues/2128
[#2134]: https://github.com/DataDog/dd-trace-rb/issues/2134
[#2138]: https://github.com/DataDog/dd-trace-rb/issues/2138
[#2140]: https://github.com/DataDog/dd-trace-rb/issues/2140
[#2150]: https://github.com/DataDog/dd-trace-rb/issues/2150
[#2153]: https://github.com/DataDog/dd-trace-rb/issues/2153
[#2158]: https://github.com/DataDog/dd-trace-rb/issues/2158
[#2162]: https://github.com/DataDog/dd-trace-rb/issues/2162
[#2163]: https://github.com/DataDog/dd-trace-rb/issues/2163
[#2170]: https://github.com/DataDog/dd-trace-rb/issues/2170
[#2173]: https://github.com/DataDog/dd-trace-rb/issues/2173
[#2174]: https://github.com/DataDog/dd-trace-rb/issues/2174
[#2180]: https://github.com/DataDog/dd-trace-rb/issues/2180
[#2191]: https://github.com/DataDog/dd-trace-rb/issues/2191
[#2200]: https://github.com/DataDog/dd-trace-rb/issues/2200
[#2201]: https://github.com/DataDog/dd-trace-rb/issues/2201
[#2219]: https://github.com/DataDog/dd-trace-rb/issues/2219
[#2229]: https://github.com/DataDog/dd-trace-rb/issues/2229
[#2248]: https://github.com/DataDog/dd-trace-rb/issues/2248
[#2250]: https://github.com/DataDog/dd-trace-rb/issues/2250
[#2252]: https://github.com/DataDog/dd-trace-rb/issues/2252
[#2257]: https://github.com/DataDog/dd-trace-rb/issues/2257
[#2258]: https://github.com/DataDog/dd-trace-rb/issues/2258
[#2265]: https://github.com/DataDog/dd-trace-rb/issues/2265
[#2267]: https://github.com/DataDog/dd-trace-rb/issues/2267
[#2279]: https://github.com/DataDog/dd-trace-rb/issues/2279
[#2283]: https://github.com/DataDog/dd-trace-rb/issues/2283
[#2289]: https://github.com/DataDog/dd-trace-rb/issues/2289
[#2293]: https://github.com/DataDog/dd-trace-rb/issues/2293
[#2296]: https://github.com/DataDog/dd-trace-rb/issues/2296
[@AdrianLC]: https://github.com/AdrianLC
[@Azure7111]: https://github.com/Azure7111
[@BabyGroot]: https://github.com/BabyGroot
[@DocX]: https://github.com/DocX
[@Drowze]: https://github.com/Drowze
[@EpiFouloux]: https://github.com/EpiFouloux
[@EvNomad]: https://github.com/EvNomad
[@HoneyryderChuck]: https://github.com/HoneyryderChuck
[@JamesHarker]: https://github.com/JamesHarker
[@Jared-Prime]: https://github.com/Jared-Prime
[@Joas1988]: https://github.com/Joas1988
[@JustSnow]: https://github.com/JustSnow
[@KieranP]: https://github.com/KieranP
[@MMartyn]: https://github.com/MMartyn
[@NobodysNightmare]: https://github.com/NobodysNightmare
[@Redapted]: https://github.com/Redapted
[@Sticksword]: https://github.com/Sticksword
[@Supy]: https://github.com/Supy
[@Yurokle]: https://github.com/Yurokle
[@ZimbiX]: https://github.com/ZimbiX
[@agirlnamedsophia]: https://github.com/agirlnamedsophia
[@agrobbin]: https://github.com/agrobbin
[@ahammel]: https://github.com/ahammel
[@ahorner]: https://github.com/ahorner
[@al-kudryavtsev]: https://github.com/al-kudryavtsev
[@albertvaka]: https://github.com/albertvaka
[@alksl]: https://github.com/alksl
[@alloy]: https://github.com/alloy
[@aurelian]: https://github.com/aurelian
[@awendt]: https://github.com/awendt
[@bartekbsh]: https://github.com/bartekbsh
[@benhutton]: https://github.com/benhutton
[@bensheldon]: https://github.com/bensheldon
[@bheemreddy181]: https://github.com/bheemreddy181
[@blaines]: https://github.com/blaines
[@brafales]: https://github.com/brafales
[@bzf]: https://github.com/bzf
[@callumj]: https://github.com/callumj
[@carlallen]: https://github.com/carlallen
[@chychkan]: https://github.com/chychkan
[@cjford]: https://github.com/cjford
[@ck3g]: https://github.com/ck3g
[@components]: https://github.com/components
[@cswatt]: https://github.com/cswatt
[@cwoodcox]: https://github.com/cwoodcox
[@dasch]: https://github.com/dasch
[@dim]: https://github.com/dim
[@dirk]: https://github.com/dirk
[@djmb]: https://github.com/djmb
[@dorner]: https://github.com/dorner
[@drcapulet]: https://github.com/drcapulet
[@dudo]: https://github.com/dudo
[@e1senh0rn]: https://github.com/e1senh0rn
[@ecdemis123]: https://github.com/ecdemis123
[@elliterate]: https://github.com/elliterate
[@elyalvarado]: https://github.com/elyalvarado
[@ericmustin]: https://github.com/ericmustin
[@erict-square]: https://github.com/erict-square
[@errriclee]: https://github.com/errriclee
[@evan-waters]: https://github.com/evan-waters
[@fledman]: https://github.com/fledman
[@frsantos]: https://github.com/frsantos
[@fteem]: https://github.com/fteem
[@gaborszakacs]: https://github.com/gaborszakacs
[@giancarlocosta]: https://github.com/giancarlocosta
[@gingerlime]: https://github.com/gingerlime
[@gkampjes]: https://github.com/gkampjes
[@gottfrois]: https://github.com/gottfrois
[@guizmaii]: https://github.com/guizmaii
[@hatstand]: https://github.com/hatstand
[@hawknewton]: https://github.com/hawknewton
[@henrich-m]: https://github.com/henrich-m
[@hs-bguven]: https://github.com/hs-bguven
[@illdelph]: https://github.com/illdelph
[@ioquatix]: https://github.com/ioquatix
[@jamiehodge]: https://github.com/jamiehodge
[@janz93]: https://github.com/janz93
[@jeffjo]: https://github.com/jeffjo
[@jennchenn]: https://github.com/jennchenn
[@jfrancoist]: https://github.com/jfrancoist
[@joeyAghion]: https://github.com/joeyAghion
[@jpaulgs]: https://github.com/jpaulgs
[@justinhoward]: https://github.com/justinhoward
[@jvalanen]: https://github.com/jvalanen
[@kelvin-acosta]: https://github.com/kelvin-acosta
[@kexoth]: https://github.com/kexoth
[@kissrobber]: https://github.com/kissrobber
[@kitop]: https://github.com/kitop
[@letiesperon]: https://github.com/letiesperon
[@link04]: https://github.com/link04
[@lloeki]: https://github.com/lloeki
[@mantrala]: https://github.com/mantrala
[@marcotc]: https://github.com/marcotc
[@marocchino]: https://github.com/marocchino
[@masato-hi]: https://github.com/masato-hi
[@matchbookmac]: https://github.com/matchbookmac
[@mberlanda]: https://github.com/mberlanda
[@mdehoog]: https://github.com/mdehoog
[@mdross95]: https://github.com/mdross95
[@michaelkl]: https://github.com/michaelkl
[@miketheman]: https://github.com/miketheman
[@mriddle]: https://github.com/mriddle
[@mscrivo]: https://github.com/mscrivo
[@mstruve]: https://github.com/mstruve
[@mustela]: https://github.com/mustela
[@nic-lan]: https://github.com/nic-lan
[@noma4i]: https://github.com/noma4i
[@norbertnytko]: https://github.com/norbertnytko
[@orekyuu]: https://github.com/orekyuu
[@palin]: https://github.com/palin
[@pj0tr]: https://github.com/pj0tr
[@psycholein]: https://github.com/psycholein
[@pzaich]: https://github.com/pzaich
[@rahul342]: https://github.com/rahul342
[@randy-girard]: https://github.com/randy-girard
[@renchap]: https://github.com/renchap
[@ricbartm]: https://github.com/ricbartm
[@roccoblues]: https://github.com/roccoblues
[@saturnflyer]: https://github.com/saturnflyer
[@sco11morgan]: https://github.com/sco11morgan
[@senny]: https://github.com/senny
[@seuros]: https://github.com/seuros
[@shayonj]: https://github.com/shayonj
[@sinsoku]: https://github.com/sinsoku
[@skcc321]: https://github.com/skcc321
[@soulcutter]: https://github.com/soulcutter
[@sponomarev]: https://github.com/sponomarev
[@stefanahman]: https://github.com/stefanahman
[@steveh]: https://github.com/steveh
[@stormsilver]: https://github.com/stormsilver
[@sullimander]: https://github.com/sullimander
[@tjgrathwell]: https://github.com/tjgrathwell
[@tjwp]: https://github.com/tjwp
[@tomasv]: https://github.com/tomasv
[@tomgi]: https://github.com/tomgi
[@tonypinder]: https://github.com/tonypinder
[@twe4ked]: https://github.com/twe4ked
[@undergroundwebdesigns]: https://github.com/undergroundwebdesigns
[@vramaiah]: https://github.com/vramaiah
[@walterking]: https://github.com/walterking
[@y-yagi]: https://github.com/y-yagi
[@yukimurasawa]: https://github.com/yukimurasawa
[@zachmccormick]: https://github.com/zachmccormick
