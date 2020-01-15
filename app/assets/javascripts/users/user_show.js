$(document).on('turbolinks:load', function() {

	//user_showチャート1
      const like_chart = document.getElementById("showRaderChart");
      const like_chart_item = gon.item
      const like_chart_taist = gon.taist
      console.log(like_chart_item)
      const showRaderChart = new Chart(like_chart, {
            type: 'radar',
            data: {
                labels: ["スッキリ", "ビター", "コク", "フルーティ"],
                datasets: [{
                    label: like_chart_item.name,
                    data: [like_chart_taist.refresh, like_chart_taist.bitter, like_chart_taist.body, like_chart_taist.fruity],
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