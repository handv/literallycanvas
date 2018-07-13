DOM = require '../reactGUI/ReactDOMFactories-shim'
createReactClass = require '../reactGUI/createReactClass-shim'
createSetStateOnEventMixin = require './createSetStateOnEventMixin'
{_} = require '../core/localization'
{classSet} = require '../core/util'

RotateButton = createReactClass
  displayName: 'RotateButton'
  getState: -> {isEnabled: not @props.lc.canUndo()}
  getInitialState: -> @getState()
  mixins: [createSetStateOnEventMixin('drawingChange')]

  render: ->
    {div} = DOM
    {lc} = @props

    className = classSet
      'lc-rotate': true
      'toolbar-button': true
      'fat-button': true
      'disabled': not @state.isEnabled
    onClick = if not lc.canUndo() then (=> lc.setRotate(1)) else -> 

    (div {className, onClick}, _('旋转'))


module.exports = RotateButton
