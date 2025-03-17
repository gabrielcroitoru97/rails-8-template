if Rails.env.development?
  DevToolbar.configure do |config|
    config.links = [
      { name: "Routes", path: "/rails/info/routes" },
      # Until we resolve https://github.com/appdev-projects/rails-8-template/issues/2,
      # we can't use Rails DB in the Rails 8 template.
      # { name: "Database", path: "/rails/db" },
      { name: "ERD", path: "/erd" }
    ]
  end
end
