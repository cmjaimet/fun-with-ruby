# Alternate to plain method - modify the base class
# to test run rails c and copy this in and hit enter
# should return:
# StaticPagesController < ApplicationController < ActionController::Base < ActionController::Metal < AbstractController::Base < Object < BasicObject
# try with other classes and objects

class Object
  def get_classes()
    cls = self.class
    out = cls.to_s
    while cls.superclass != nil
      cls = cls.superclass
      out += ' < ' + cls.to_s
    end
    out
  end
end

#example uses

StaticPagesController.new.get_classes

(3..54).get_classes

"some string".get_classes
