namespace 'SensuDashboard.Views.Events', (exports) ->

  class exports.Item extends SensuDashboard.Views.Base

    name: 'events/item'

    tagName: 'tr'

    className: ->
      @model.get('status_name')

    events:
      'click input[type=checkbox]': 'toggleSelect'

    initialize: ->
      @template = HandlebarsTemplates[@name]
      @listenTo(@model, 'change', @render)
      @listenTo(@model, 'destroy', @remove)

    render: ->
      @$el.html(@template(@model.toJSON()))
      return this

    # showEventDetails: (ev) ->
    #   data_id = $(ev.target).parents('tr').first().attr('data-id')
    #   current_event = SensuDashboard.Events.get(data_id)
    #   current_client = SensuDashboard.Clients.get(current_event.attributes.client)
    #   SensuDashboard.EventsMetadata.set
    #     current_event: current_event
    #     current_client: current_client
    #   $('#event_modal').modal()

    toggleSelect: ->
      @model.set({ selected: !@model.get('selected') })
