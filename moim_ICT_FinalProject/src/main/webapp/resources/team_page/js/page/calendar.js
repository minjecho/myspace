$(function() {
    enableDrag();
	var eventlist;
	var team_num = ${team_num};
	$.ajax({
		url: "selectcalendarlist.do",
		async: false,
		type: "post",
		data: {"team_num" : team_num},
		dataType : "json",
		success: function(data){
			console.log("success : " + data);
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			eventlist = json.clist;
			console.log(eventlist);
		},
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
    	}
	}); //ajax

    function enableDrag() {
        $('#external-events .fc-event').each(function() {
            $(this).data('event', {
                title: $.trim($(this).text()), // use the element's text as the event title
                stick: true // maintain when user navigates (see docs on the renderEvent method)
            });
            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 999,
                revert: true, // will cause the event to go back to its
                revertDuration: 0 //  original position after the drag
            });
        });
    }
    $(".save-event").on('click', function() {
        var categoryName = $('#addNewEvent form').find("input[name='category-name']").val();
        var categoryColor = $('#addNewEvent form').find("select[name='category-color']").val();
        if (categoryName !== null && categoryName.length != 0) {
            $('#event-list').append('<div class="fc-event bg-' + categoryColor + '" data-class="bg-' + categoryColor + '">' + categoryName + '</div>');
            $('#addNewEvent form').find("input[name='category-name']").val("");
            $('#addNewEvent form').find("select[name='category-color']").val("");
            enableDrag();
        }
    });
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd
    }
    if (mm < 10) {
        mm = '0' + mm
    }
    var current = yyyy + '-' + mm + '-';
    var calendar = $('#calendar');
    // Add direct event to calendar
    var newEvent = function(start) {
        $('#addDirectEvent input[name="event-name"]').val("");
		$('#addDirectEvent input[name="event-start"]').val("");
		$('#addDirectEvent input[name="event-end"]').val("");
        $('#addDirectEvent select[name="event-color"]').val("");
		$('#addDirectEvent textarea[name="event-desc"]').val("");
        $('#addDirectEvent').modal('show');
        $('#addDirectEvent #saveEvent').unbind();
        $('#addDirectEvent #saveEvent').on('click', function() {
			var team_num = 1;
			var cal_writer = 1;
            var cal_title = $('#addDirectEvent input[name="event-name"]').val();
            var cal_startdate = $('#addDirectEvent input[name="event-name"]').val();
			var cal_enddate = $('#addDirectEvent input[name="event-name"]').val();
			var cal_color = $('#addDirectEvent input[name="event-name"]').val();
			var cal_detail = $('#addDirectEvent input[name="event-name"]').val();
            
			var eventData = {
				title: cal_title,
				start: cal_startdate,
				end: cal_enddate,
				cal_writer: cal_writer,
				team_num: team_num,
				cal_detail: cal_detail,
				eventColor: cal_color,
				allDay: true
			}
			
			if (eventData.start > eventData.end){
				alert('끝나는 날짜가 앞설 수 없습니다.');
				return false;
			}
			
			if (eventData.title === ''){
				alert("일정명은 필수입니다.");
				return false;
			}
			
            calendar.fullCalendar('renderEvent', eventData, true);
            $('#addDirectEvent').modal('hide');
			
			$.ajax({
				type: "post",
				url: "",
				data: eventData,
				success: function(result){
					alert("success" + result);
					location.href = "moveTPcalendar.do";
				},
				error: function(jqXHR, textstatus, errorthrown) {
    			console.log("error : " + jqXHR + ", " + textstatus + ", "
    					+ errorthrown);
    			}
			});
			
        });
    }
    // initialize the calendar
    calendar.fullCalendar({
        header: {
	                left   : 'today, prevYear, nextYear',
	                center : 'prev, title, next',
	                right  : 'month, agendaWeek, agendaDay, listWeek'
	            },
        editable: true,
		locale: 'ko',
        droppable: true,
        eventLimit: true, // allow "more" link when too many events
        selectable: true,
        eventRender: function(eventObj, $el) {
	      $el.popover({
	        title: eventObj.title,
	        content: eventObj.title,
	        trigger: 'hover',
	        placement: 'top',
	        container: 'body'
	      });
    	},
		events: eventlist,
        drop: function(date, jsEvent) {
            // var originalEventObject = $(this).data('eventObject');
            // var $categoryClass = $(this).attr('data-class');
            // var copiedEventObject = $.extend({}, originalEventObject);
            // //console.log(originalEventObject + '--' + $categoryClass + '---' + copiedEventObject);
            // copiedEventObject.start = date;
            // if ($categoryClass)
            //   copiedEventObject['className'] = [$categoryClass];
            // calendar.fullCalendar('renderEvent', copiedEventObject, true);
            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }
        },
        select: function(start, end, allDay) {
            newEvent(start);
        },
        eventClick: function(calEvent, jsEvent, view) {
            //var title = prompt('Event Title:', calEvent.title, { buttons: { Ok: true, Cancel: false} });
            var eventModal = $('#eventEditModal');
            eventModal.modal('show');
            eventModal.find('input[name="event-name"]').val(calEvent.title);
            eventModal.find('.save-btn').click(function() {
                calEvent.title = eventModal.find("input[name='event-name']").val();
                calendar.fullCalendar('updateEvent', calEvent);
                eventModal.modal('hide');
            });
            // if (title){
            //     calEvent.title = title;
            //     calendar.fullCalendar('updateEvent',calEvent);
            // }
        }
    });
});