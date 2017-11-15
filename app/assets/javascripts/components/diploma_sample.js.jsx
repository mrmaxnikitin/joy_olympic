const DiplomaSample = React.createClass({
  //BEGIN***************************************************DECLARE
  clickHandler: function(){
      var item = this.props.item
      //Для новых дипломов
      if (item == '1') item = '11'
      else if (item == '2') item = '12'
      else if (item == '3') item = '13'
      else if (item == '4') item = '14'
      else if (item == '5') item = '15'
      else if (item == '6') item = '16'
      else if (item == '7') item = '17'
      else if (item == '8') item = '18'
      else if (item == '9') item = '19'
      else if (item == '10') item = '20'
      this.props.chooseDiploma(item);
  },
  render: function() {
    var item = this.props.item
    //Для новых дипломов
    if (item == '1') item = '11'
    else if (item == '2') item = '12'
    else if (item == '3') item = '13'
    else if (item == '4') item = '14'
    else if (item == '5') item = '15'
    else if (item == '6') item = '16'
    else if (item == '7') item = '17'
    else if (item == '8') item = '18'
    else if (item == '9') item = '19'
    else if (item == '10') item = '20'
    var src_url = '/diploma_samples/' + item + '.jpg'
    var classImg = 'col-2of6 pd10 '
    if (this.props.diploma_id == item)
      classImg += 'emphasize'
    return (
      <img className={classImg} src={src_url}  onClick={this.clickHandler}/>
    );
  }
})
