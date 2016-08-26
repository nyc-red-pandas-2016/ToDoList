import React, { Component } from 'react';

export default class CreateForm extends Component {

    handleSubmit(event) {
      event.preventDefault();
      let inputDOM = this.refs.toDoListItem;
      this.props.onSubmit(inputDOM.value);
      inputDOM.value = '';
    }

  render() {
    return (
      <section id="form">
        <form id="todo-form" onSubmit={this.handleSubmit}>
          <input type="text" ref="toDoListItem" placeholder="new errand"></input>
          <input type="submit" value="Create"/>
        </form>
      </section>
    )
  }
}
