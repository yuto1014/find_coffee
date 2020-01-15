$(document).on('turbolinks:load', function() {
	console.log("user_showチャート1")
	    //item_showチャート
	    const ctx = document.getElementById("myRaderChart");
	    const item = gon.item_show
	    // console.log(item)
	    const taist = gon.taist_show
	    console.log(item)
	      const myRadarChart = new Chart(ctx, {
	          type: 'radar',
	          data: {
	              labels: ["スッキリ", "ビター", "コク", "フルーティ"],
	              datasets: [{
	                  label: item.name,
	                  data: [taist.refresh, taist.bitter, taist.body, taist.fruity],
	                  //data: [1, 2, 3, 2],
	                  backgroundColor: 'RGBA(135, 206, 235, 0.5)',
	                  borderColor: 'RGBA(65, 105, 225, 1)',
	                  borderWidth: 1,
	                  pointBackgroundColor: 'RGB(46,106,177)'
	              }]
	          },
	          options: {
	            title: {
	                display: true,
	                text: ''
	            },
	            scale:{
	                ticks:{
	                    suggestedMin: 0,
	                    suggestedMax: 3,
	                    stepSize: 1,
	                    callback: function(value, index, values){
	                      if(value == 1){
	                          return "やや感じる"
	                      }else if(value == 2){
	                        return "感じる"
	                      }else{
	                        return "強く感じる"
	                      }
	                    }
	                  }
	                }
	              }
	 });

});