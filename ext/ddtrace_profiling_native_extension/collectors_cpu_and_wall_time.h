#pragma once

#include <ruby.h>

VALUE cpu_and_wall_time_collector_sample(VALUE self_instance);
VALUE enforce_cpu_and_wall_time_collector_instance(VALUE object);
