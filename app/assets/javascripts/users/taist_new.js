$(document).ready(function() {
  		$('#refresh1').click(function() {
  				alert('1 is clicked');
      			$(".hidden1").attr('disabled', false);
  		});

  		$('#refresh2').click(function() {
  				alert('2 is clicked');
      			$(".hidden2").attr('disabled', false);
		});
});