# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
# define String.replaceAll
  String.prototype.replaceAll=(exp, newStr) ->
    return this.replace(new RegExp(exp, "gm"), newStr)

# define String.format
  String.prototype.format=(args) ->
    if arguments.length < 1
      return this
    else
      result=this

    if (arguments.length == 1 && typeof (args) == "object")
      data = args
    else
      data = arguments

    for key,value of data
      if undefined != value
        result=result.replaceAll("\\{" + key + "\\}", value);

    return result





