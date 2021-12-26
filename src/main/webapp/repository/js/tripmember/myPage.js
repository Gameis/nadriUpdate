	/* global bootstrap: false */

	//부트스트랩 퍼온부분이라 정확한 것은 파악못함
	(function () {
	  'use strict'
	  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
	    new bootstrap.Tooltip(tooltipTriggerEl)
	  })
	})()
