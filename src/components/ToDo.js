import React, { Component } from 'react'

export default class ToDo extends Component {
  render () {
    var todo = this.props.todo;

    return (
      <li>{todo.item}</li>
    );
  }
}
