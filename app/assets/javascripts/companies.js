//= require jquery.ui.autocomplete

$(function() {
	var company_names = [],
		companies_by_name = {},
		company;
	
	for (var i=0, j=COMPANIES.length; i<j; i++) {
		company = COMPANIES[i];
		company_names.push({
			value: company.name,
			label: company.name,
			address: company.address
		});
		companies_by_name[company.name] = {
			address: company.address
		};
	}

	console.log("companies loaded", company_names);

	$('#company_address_confirm').hide();
	$('#company_address_display').hide();

	$('#company_name').autocomplete({
		source: company_names,
		select: function(e, ui) {
			console.log(ui.item, $.fx);
			
			$('#company_address_confirm').show();
			$('#company_address_display').text(ui.item.address).show();
		}
	})
	.data("autocomplete")._renderItem = function(ul, item) {
		return $("<li></li>")
				.data("item.autocomplete", item)
				.append("<a>" + item.label + " <i>(" + item.address + ")</i></a>")
				.appendTo(ul);
	};
});
