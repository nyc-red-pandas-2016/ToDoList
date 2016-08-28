import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
import { createContainer } from 'meteor/react-meteor-data';
import { Tasks } from '../api/tasks.js';

import Task from './Task.jsx';

class App extends Component {
    //React components have a special field called 'state' where you can store encapsulated component data
    constructor(props) {
      super(props);

    //here we add an initial state to App component
      this.state = {
        hideCompleted: false,
      };
    }
   //we can update this.state from an event handler by calling this.setState, which will then update the state property asynchronously and then cause the component to re-render

    handleSubmit(event) {
      event.preventDefault();

      // find the text field via the React 'ref'
      const text = ReactDOM.findDOMNode(this.refs.textInput).value.trim();

      Tasks.insert({
        text,
        createdAt: new Date(),
      });

      //clear form
      ReactDOM.findDOMNode(this.refs.textInput).value = '';
    }

    toggleHideCompleted() {
      this.setState({
        hideCompleted: !this.state.hideCompleted,
      });
    }


     renderTasks() {
       let filteredTasks = this.props.tasks;
       if (this.state.hideCompleted) {
         filteredTasks = filteredTasks.filter(task => !task.checked);
       }
       return filteredTasks.map((task) => (
         <Task key={task._id} task={task} />
       ));
     }

     render() {
       return (
         <div className="container">
           <header>
             <h1>Todo List ({this.props.incompleteCount})</h1>
              <label className="hide-completed">
                <input
                  type="checkbox"
                  readOnly
                  checked={this.state.hideCompleted}
                  onClick={this.toggleHideCompleted.bind(this)}
                />
                Hide Completed Tasks
              </label>


              <form className="new-task" onSubmit={this.handleSubmit.bind(this)} >
                <input
                  type="text"
                  ref="textInput"
                  placeholder="Type to add new tasks"
                  />
              </form>
           </header>

           <ul>
             {this.renderTasks()}
           </ul>
         </div>
       );
     }
}

App.propTypes = {
  tasks: PropTypes.array.isRequired,
  incompleteCount: PropTypes.number.isRequired,
};

export default createContainer(() => {
  return {
    tasks: Tasks.find({}, { sort: { createdAt: -1 } }).fetch(),
    incompleteCount: Tasks.find({ checked: { $ne: true } }).count(),
  };
}, App);
