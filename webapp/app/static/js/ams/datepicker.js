var ams = ams || {};

ams.datepicker = {	
	Datepicker: function() {	
		this.regional = function(lang) {
			if(lang == "br") {
				return {
					closeText: 'Fechar',
					currentText: 'Hoje',
					monthNames: ['Janeiro','Fevereiro','Mar&#231;o','Abril','Maio','Junho', 
								'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
					monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun',
									'Jul','Ago','Set','Out','Nov','Dez'],
					dayNames: ['Domingo','Segunda','Ter&#231;a','Quarta','Quinta','Sexta','S&#225;bado'],
					dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
					dayNamesMin: ['D','S','T','Q','Q','S','S'],
					dateFormat: 'dd/mm/yy',
				};
			}
		}
	},
};