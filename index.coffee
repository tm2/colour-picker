Emitter = require('emitter')
delegate = require('delegate');

module.exports = class ColourPicker extends Emitter
  palettes:[
    [
      ['#FFFFFF', '#000000', '#EEECE1', "#1F497D", "#4F81BD", "#C0504D", "#9BBB59", "#8064A2", "#4BACC6", "#F79646"]
    ],
    [
      ['#F2F2F2', '#7F7F7F', '#DDD9C3', "#C6D9F0", "#DBE5F1", "#F2DCDB", "#EBF1DD", "#E5E0EC", "#DBEEF3", "#FDEADA"],
      ['#D8D8D8', '#595959', '#C4BD97', '#8DB3E2', '#B8CCE4', '#E5B9B7', '#D7E3BC', '#CCC1D9', '#B7DDE8', '#FBD5B5'],
      ['#BFBFBF', '#3F3F3F', '#938953', '#548DD4', '#95B3D6', '#D99694', '#C3D69B', '#B2A2C7', '#92CDDC', '#FAC08F'],
      ['#A5A5A5', '#262626', '#494429', '#17365D', '#366092', '#963A37', '#76923C', '#5F497A', '#31859B', '#E36C09'],
      ['#808080', '#0C0C0C', '#1D1B10', '#0F243E', '#244061', '#632423', '#4F6128', '#3F3151', '#205867', '#974806']
    ],
    [
      ['#FFFFFF', '#C0C0C0', '#FF0000', "#FFFF00", "#00FF00", "#00FFFF", "#0000FF", "#FF00FF"]
    ],
    [
      ['#000000', '#808080', '#800000', "#808000", "#008000", "#008080", "#000080", "#800080"]
    ]
  ]

  getTemplate: =>
    template = "<span class='colour-picker'>"
    if @useDefault is true
      template += "<div class='colour default'>Use Default</div>"

    for palette in [0..@palettes.length-1]
      template += "<table>"
      for swatch in [0..@palettes[palette].length-1]
        template += "<tr>"
        for colour in [0..@palettes[palette][swatch].length-1]
          template += "<td><div class='colour' style='background-color:#{@palettes[palette][swatch][colour]}'/></td>"
        template += "</tr>"
      template += "</table>"
    template += "</span>"
    return template

  render: =>
    el = document.createElement('div');
    el.innerHTML = @getTemplate();

    delegate.bind(el, '.colour', 'click', (e)=>
      @emit('picked', e.target.style.backgroundColor)
    , false);
    return el
