# to test run rails c and copy this in and hit enter
# should return:
# StaticPagesController < ApplicationController < ActionController::Base < ActionController::Metal < AbstractController::Base < Object < BasicObject
# try with other classes and objects

def get_classes( obj )
  cls = obj.class
  print cls.to_s
  while cls.superclass != nil
    cls = cls.superclass
    print ' < ' + cls.to_s
  end
end

get_classes( StaticPagesController.new )

get_classes( (3..54)) )

get_classes( "some string" )
