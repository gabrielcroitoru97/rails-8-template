if Rails.env.development? || Rails.env.test?
  GradeRunner.config do |config|
    config.default_points = 1           # default 1
    config.override_local_specs = false # default true
  end
end
