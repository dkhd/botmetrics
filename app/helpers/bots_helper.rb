module BotsHelper
  def solo_chartjs_opts
    {
      library: {
        scales: {
          xAxes: [
            {
              time: {
                displayFormats: {
                  'day': 'MMM D',
                  'week': 'MMM D'
                }
              }
            }
          ]
        }
      }
    }
  end

  def dashboard_chartjs_opts
    {
      height: '100px',
      library: {
        elements: {
          point: {
            radius: 0
          },
          line: {
            borderWidth: 6,
            lineTension: 0.0
          },
        },
        scales: {
          xAxes: [{display: false}],
          yAxes: [
            {
              color: '#fff',
              ticks: {
                fontSize: 8,
                fontColor: '#fff'
              },
              gridLines: {
                drawOnChartArea: false,
                color: '#fff',
                drawTicks: false
              },
              scaleLabel: {
                fontSize: 0,
                fontColor:'#fff'
              }
            }
          ]
        }
      }
    }
  end

  def formatted_growth(growth)
    if growth.present?
      growth = growth * 100
      klass = growth > 0 ? 'positive' : 'negative'

      icon = if growth.to_f == 0.0
               "<i class='fa fa-arrows-h'></i>"
             elsif growth.to_f > 0.0
               "<i class='fa fa-arrow-up'></i>"
             else
               "<i class='fa fa-arrow-down'></i>"
             end

      "<p class='growth #{klass}'>#{icon}#{number_to_percentage(growth, precision: 0)}</p>".html_safe
    else
      nil
    end
  end
end