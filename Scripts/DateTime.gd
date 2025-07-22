class_name DateTime

var day: int
var month: int
var year: int

static var day_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var month_names := {
	0: "January",
	1: "February",
	2: "March",
	3: "April",
	4: "May",
	5: "June",
	6: "July",
	7: "August",
	8: "September",
	9: "October",
	10: "November",
	11: "December"
}

func _init(date_day, date_month, date_year):
	self.day = date_day
	self.month = date_month
	self.year = date_year
	
func copy():
	return DateTime.new(self.day, self.month, self.year)

func add_day():
	day += 1
	if day > get_day_count_in_month():
		day = 1
		month += 1
		if month == 12:
			month = 0
			year += 1

func add_days(day_count):
	for i in range(day_count):
		add_day()

func get_date_after_days(days):
	var result = copy()
	result.add_days(days)
	return result

func is_leap_year():
	return year % 400 == 0 or year % 100 != 0 and year % 4 == 0
	
func describe():
	return "%s %s %d" % [str(day).pad_zeros(2), month_names[month], year]

func is_equal(other_date):
	return day == other_date.day and month == other_date.month and year == other_date.year
	
func is_greater(other_date):
	return year > other_date.year or year == other_date.year and month > other_date.month or year == other_date.year and month == other_date.month and day > other_date.day

static func get_random_date(left_border, right_border):
	var result_year = left_border + randi() % (right_border - left_border + 1)
	var result_month = 1 + randi() % 12
	var result_day = 1 + randi() % (day_in_month[result_month - 1])
	return DateTime.new(result_day, result_month, result_year)

static func get_years_between_dates(first_date, second_date):
	var years_between_dates = second_date.year - first_date.year
	if not(second_date.month > first_date.month or second_date.month == first_date.month and second_date.day > first_date.day):
		years_between_dates -= 1
	return years_between_dates

func get_day_count_in_month():
	if is_leap_year() and month == 1:
		return 29
	else:
		return day_in_month[month]
