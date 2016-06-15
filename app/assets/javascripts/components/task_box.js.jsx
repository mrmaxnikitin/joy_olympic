const TaskBox = React.createClass({
  //BEGIN***************************************************DECLARE
  propTypes: {
    tasks_url: React.PropTypes.string.isRequired
  },
  getInitialState: function () {
    return {
      complete_contest: false,
      tasks_count: 15,
      tasks: [],
      user_answers: []
    };
  },
  componentDidMount: function() {
    /*var current_answers = this.state.user_answers
    for (var i = 0; i < this.state.tasks_count; i++){
      current_answers.push([0, 0])
    }
    this.setState({
      user_answers: current_answers
    });*/
    this.loadTasksFromServer();
    //intervalID = setInterval(this.loadNewsItemsFromServer, this.props.pollInterval);
  },
  componentWillUnmount: function(){
  },
  loadTasksFromServer: function() {
    $.ajax({
      url: this.props.tasks_url,
      dataType: 'json',
      data: {
        count: this.state.tasks_count
      },
      cache: false,
      success: function(data) {
        this.setState({
          complete_contest: false,
          tasks: data
        });
      }.bind(this),
      error: function(xhr, status, err) {
        //CE(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  completeContest: function(){
    var current_answers = this.state.user_answers

    var tasks = this.state.tasks
    for (var key in tasks) {
      var radio = document.getElementsByName('var-ans'+tasks[key].id);
      for (var j = 0; j < radio.length; j++) {
        if (radio[j].type == "radio" && radio[j].checked){
          current_answers.push([tasks[key].id, radio[j].value]);
          break
        }
        if (j == radio.length - 1) current_answers.push([tasks[key].id, 0]);
      }
    }

    this.setState({
      complete_contest: true,
      user_answers: current_answers
    });
  },
  render: function() {
    var tasks = this.state.tasks.map(function (task) {
      return (
        <Task
          key={task.id}
          task={task} />
      );
    }.bind(this));

    if(!this.state.complete_contest){
      var button_check_result = <a className='btn btn-our btn-our-green'
             onClick={this.completeContest}>Проверить результат!</a>
    }
    var show_answer
    if(this.state.user_answers.length) show_answer = this.state.user_answers[1][1]
    return (
      <div className='participate-page'>
        <div className="hidden-xs pinpen"></div>
        {tasks}
        {show_answer}
        <div className='wrap-complete-contest'>
          {button_check_result}
        </div>
      </div>
    );
  }
});

