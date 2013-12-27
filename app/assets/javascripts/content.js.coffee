# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file:
#    http://jashkenas.github.com/coffee-script/

epoch_ms_to_date = (milliseconds) ->
  d = new Date(0)
  d.setUTCMilliseconds(milliseconds)
  return d.getFullYear() + "-" + d.getMonth() + 1 + "-" + d.getDate();


create_event_list = () ->
  meetings = []
  for meeting in gon.meetings
    meeting_info = { 
      title: meeting.name, 
      start: epoch_ms_to_date(meeting.time)
    }
    meetings.push meeting_info
  return meetings


create_calendar = () ->
  $('#meeting_calendar').fullCalendar({
    weekMode: 'liquid',
    events: create_event_list(),
    eventColor: '#EB6D50',
  }) 


$(window).load ->
  create_calendar() if gon
