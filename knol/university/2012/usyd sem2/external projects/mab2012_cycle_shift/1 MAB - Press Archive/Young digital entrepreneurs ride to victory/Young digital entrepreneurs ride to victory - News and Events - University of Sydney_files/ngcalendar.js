NG.Calendar = function () {
	this.today = new Date();
	this.today.setHours(0,0,0,0);
	this.month = this.today.getMonth()+1;
	this.year = this.today.getFullYear();
	this.dow = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
	this.months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
	this.startDow = 1;
	this.node = null;
	this.showOutsideDays = false;
	this.labelNode = null;
	this.daysNode = null;
	this.prevNode = document.createTextNode('< Prev');
	this.nextNode = document.createTextNode('Next >');
	this.dateFuncs = {};
	this.minDate = null;
	this.maxDate = null;

	this.showDate = function (date) {
		if (!isObj(date)) date = new Date(date);
		this.month = date.getMonth()+1;
		this.year = date.getFullYear();
		this.refresh();
	}

	this.setDateFunc = function (date, func) {
		if (!isObj(date)) date = new Date(date);
		this.dateFuncs[date.valueOf()] = func;
	}

	this.changeMonth = function (delta) {
		if (!this.checkChangeMonth(delta)) return;
		var newMth = new Date(this.year, this.month-1+delta, 1);
		this.month = newMth.getMonth()+1;
		this.year = newMth.getFullYear();
		this.refresh();
	}

	this.checkChangeMonth = function (delta) {
		var mthStart = new Date(this.year, this.month-1+delta, 1);
		var mthEnd = new Date((new Date(this.year, this.month+delta, 1))-1);
		if (!isNull(this.minDate) && this.minDate > mthEnd) return false;
		if (!isNull(this.maxDate) && this.maxDate < mthStart) return false;
		return true;
	}

	this.execDateFunc = function (td) {
		var func;
		if (!isNull(func = this.getDateFunc(td.dateValue))) {
			func(td.dateValue);
		}
	}

	this.refresh = function () {
		this.getLabelNode().firstChild.nodeValue = this.months[this.month-1]+' '+this.year;
		this.getLabelNode().previousSibling.className = 'prev-nav'+(this.checkChangeMonth(-1) ? '' : '-disabled');
		this.getLabelNode().nextSibling.className = 'next-nav'+(this.checkChangeMonth(1) ? '' : '-disabled');
		var dayNode, day = new Date(this.year, this.month-1, 1);
		day.setDate(1-day.getDay());
		for (var i = 0; i < 6*7; i++) {
			dayNode = this.getDaysNode().childNodes[Math.floor(i/7)].childNodes[i%7];
			dayNode.dateValue = new Date(day.getFullYear(), day.getMonth(), day.getDate());
			if (day.getFullYear() < this.year || (day.getFullYear() == this.year && day.getMonth() < this.month-1)) {
				dayNode.className = 'prev-month';
				dayNode.firstChild.nodeValue = (this.showOutsideDays ? day.getDate() : '');
			} else if (day.getFullYear() > this.year || (day.getFullYear() == this.year && day.getMonth() > this.month-1)) {
				dayNode.className = 'next-month';
				dayNode.firstChild.nodeValue = (this.showOutsideDays ? day.getDate() : '');
			} else {
				dayNode.className = (isNull(this.getDateFunc(day)) ? '' : 'hasFunc');
				dayNode.firstChild.nodeValue = day.getDate();
			}
			if (!isNull(this.minDate) && day.valueOf() < this.minDate) dayNode.className += ' disabled';
			else if (!isNull(this.maxDate) && day.valueOf() > this.maxDate) dayNode.className += ' disabled';
			if (day.valueOf() == this.today.valueOf()) dayNode.className += ' today';
			day.setDate(day.getDate()+1);
		}
	}

	this.originalGetDateFunc = this.getDateFunc = function (day) {
		if (!isDef(typeof this.dateFuncs[day.valueOf()])) return N;
		if (!isNull(this.minDate) && day.valueOf() < this.minDate) return N;
		else if (!isNull(this.maxDate) && day.valueOf() > this.maxDate) return N;
		return this.dateFuncs[day.valueOf()];
	}

	this.getLabelNode = function () {
		return this.getNode().firstChild.childNodes[1];
	}

	this.getDaysNode = function () {
		return this.getNode().childNodes[1].childNodes[1];
	}

	this.attach = function (node) {
		node.appendChild(this.getNode());
	}

	this.getNode = function () {
		if (isNull(this.node)) {
			this.node = document.createElement('div');
			this.node.className = 'calendar';
			var part,header = this.node.appendChild(document.createElement('div'));
			header.className = 'header';
			part = header.appendChild(document.createElement('div'));
			part.appendChild(this.prevNode);
			part.className = 'prev-nav';
			NG.addTrigger(part, 'click', [this, 'changeMonth'], 0, [-1]);
			part = header.appendChild(document.createElement('div'));
			part.appendChild(document.createTextNode(''));
			part = header.appendChild(document.createElement('div'));
			part.appendChild(this.nextNode);
			part.className = 'next-nav';
			NG.addTrigger(part, 'click', [this, 'changeMonth'], 0, [1]);
			var tr,td,tbody,table = this.node.appendChild(document.createElement('table'));
			tbody = table.appendChild(document.createElement('thead'));
			tr = tbody.appendChild(document.createElement('tr'));
			for (var i = 0; i < 7; i++) {
				td = tr.appendChild(document.createElement('th'));
				td.appendChild(document.createTextNode(this.dow[i]));
			}
			tbody = table.appendChild(document.createElement('tbody'));
			for (var i = 0; i < 6; i++) {
				tr = tbody.appendChild(document.createElement('tr'));
				for (var j = 0; j < 7; j++) {
					td = tr.appendChild(document.createElement('td'));
					td.appendChild(document.createTextNode(''));
					NG.addTrigger(td, 'click', [this, 'execDateFunc'], 0, [td]);
				}
			}
			this.refresh();
		}
		return this.node;
	}
}
