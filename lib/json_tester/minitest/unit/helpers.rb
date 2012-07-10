require 'json'

module JsonTester
  module MiniTest
    module Unit
      module Helpers
        def assert_json_match(exp, act, msg = nil)
          unless JsonTester::Matcher === exp
            exp = JsonTester::Matcher.new(exp)
          end

          if String === act
            assert act = JSON.parse(act), "Expected #{mu_pp(act)} to be valid JSON"
          end

          assert exp =~ act, ->{exp.last_error}

          # Return the matcher
          return exp
        end
      end
    end
  end
end