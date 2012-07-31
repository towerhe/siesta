## Siesta

[![Build
Status](https://secure.travis-ci.org/towerhe/siesta.png)](http://travis-ci.org/towerhe/siesta)
[![Dependency
Status](https://gemnasium.com/towerhe/siesta.png)](https://gemnasium.com/towerhe/siesta)
[![Code
Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/towerhe/siesta)

A rails mountable engine setting up
[siesta](http://www.bryntum.com/products/siesta/) for testing ExtJS.

### Install

Add siesta to Gemfile:

```ruby
gem 'siesta'
```

And then run `bundle install` to install siesta. That's all.

### Usage

* Mount the engine in your rails application.

```ruby
# config/routes
if Rails.env.development?
  mount Siesta::Engine => '/'
end
```

* (OPTIONAL) Configure siesta.
  * spec_dir - Default directory of specs is `spec/javascripts`, so you should create you specs under `spec/javascripts` by default. But you could change the default value through an initializer.

    ```ruby
    # config/initializers/siesta.rb
    Siesta.configure do |config|
      config.spec_dir = 'test/javascripts'
    end
    ```

  * auto_organizing - Organizing the tests by folders, default is true.

    ```ruby
    # config/initializers/siesta.rb
    Siesta.configure do |config|
      config.auto_organizing = false
    end
    ```
    If you do not enable auto_organizing function, you need to create a
`test_harness.js` under `spec_dir` to organize your tests.

    ```javascript
    var Harness = Siesta.Harness.Browser.ExtJS;

    Harness.start({
      group               : 'Sample',
      items               : [
        '/assets/sample.t.js'
      ]
    });
    ```

* Create your specs under the directory of specs.

```javascript
// spec/javascripts/sample.t.js
StartTest(function(t) {
  t.ok(1 == 1, 'A sample test');
})    
```

* Create `spec/javascripts/test_harness.js` to start.

```javascript
// spec/javascript/test_harness.js
var Harness = Siesta.Harness.Browser.ExtJS;

Harness.start({
  group: 'Sample',
  items: ['/assets/sample.t.js']
});
```

* Start up the application, and then run your tests through
   [http://localhost:3000/siesta](http://localhost:3000/siesta).

```bash
rails s
```

* (OPTIONAL) Customize the behavior of siesta. See the [Siesta.Harness.Browser.ExtJS](http://www.bryntum.com/products/siesta/docs/#!/api/Siesta.Harness.Browser.ExtJS) for a detailed description of all available options.

```javascript
// spec/javascripts/siesta_config.js
Siesta.Harness.Browser.ExtJS.configure({
  title: 'Dummy App',
  loaderPath: { 'DummyApp' : '/assets/extjs/app' },

  preload : [
    "/assets/extjs/resources/css/ext-all.css",
    "/assets/extjs/ext-all-debug.js"
  ]
});
```

For more detail about how to test your ExtJS, please visit:
[http://www.bryntum.com/products/siesta/docs/](http://www.bryntum.com/products/siesta/docs/)

### License

This project rocks and uses GPLv3.
