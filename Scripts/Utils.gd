class_name Utils

static func get_random_set(set_length, left_border, right_border):
	var random_set = []
	var possible_numbers = []
	for i in range(left_border, right_border):
		possible_numbers.append(i)
	for i in range(set_length):
		var rand_index = randi() % len(possible_numbers)
		random_set.append(possible_numbers[rand_index])
		possible_numbers.remove_at(rand_index)
	return random_set
	
static func get_groups(group_count, group_len):
	var indices = []
	for i in range(group_count * group_len):
		indices.append(i)
	var groups = []
	for group_index in range(group_count):
		var group = []
		for team_index_in_group in range(group_len):
			var rand_index = randi() % len(indices)
			group.append(indices[rand_index])
			indices.remove_at(rand_index)
		groups.append(group)
	return groups
