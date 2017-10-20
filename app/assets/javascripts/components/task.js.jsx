const Task = React.createClass({
  //BEGIN***************************************************DECLARE
  clickHandle: function () {
    var mySound = new buzz.sound("/sounds/button_tiny", {
        formats: [ "mp3", "aac", "ogg" ],
        preload: true,
        autoplay: true,
        loop: false
    });
  },
  render: function() {
    var task = this.props.task

    var name_radio = "var-ans" + task.id
    var id_radio = "var" + task.id
    return (
      <div className='task-participate animated fadeIn'>
        <img src= {task.image} className='taks-img' />
        <div className='task-body'>
          <div className='text'>
            {task.text}
          </div>
          <div className='variants'>
            <p className='wrap-radio'>
              <input className="radioanswer" type="radio" name={name_radio} id={id_radio+'1'} onClick={this.clickHandle} value="1" />
              <label htmlFor={id_radio+'1'}>{task.var1}</label>
            </p>
            <p className='wrap-radio'>
              <input className="radioanswer" type="radio" name={name_radio} id={id_radio+'2'} onClick={this.clickHandle} value="2" />
              <label htmlFor={id_radio+'2'}>{task.var2}</label>
            </p>
            <p className='wrap-radio'>
              <input className="radioanswer" type="radio" name={name_radio} id={id_radio+'3'} onClick={this.clickHandle} value="3" />
              <label htmlFor={id_radio+'3'}>{task.var3}</label>
            </p>
            <p className='wrap-radio'>
              <input className="radioanswer" type="radio" name={name_radio} id={id_radio+'4'} onClick={this.clickHandle} value="4" />
              <label htmlFor={id_radio+'4'}>{task.var4}</label>
            </p>
          </div>
        </div>
        <div className='clearboth'>
        </div>
      </div>
    );
  }
})
