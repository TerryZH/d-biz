# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# dynamically add new item (used in materials and productions)
$ ->
  window.HashMap = {
    createNew: () ->
      hashMapSet = (key,value) ->
        this[key] = value
      hashMapGet = (key) ->
        return this[key]
      hashMapDel = (key) ->
        delete this[key]
      hashMapHas = (key) ->
        if this.get(key)
          return true
        else
          return false
      hashMapAdd = (key,value) ->
        if this.get(key)
          this[key] += value
        else
          this.set(key,value)
      myHashMap = {
        set : hashMapSet,
        get : hashMapGet,
        has : hashMapHas,
        del : hashMapDel,
        add : hashMapAdd
      }
      return myHashMap
  }
