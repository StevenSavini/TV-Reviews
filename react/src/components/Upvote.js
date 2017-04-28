import React, {Component} from 'react';

class Upvote extends Component {
  constructor(props) {
    super(props);

    this.handleUpvoteSubmit = this.handleUpvoteSubmit.bind(this)
  }

  handleUpvoteSubmit(event){
    event.preventDefault()
    this.props.handleClick(this.props.review);
  }

  render() {
    return(
      <form onSubmit={this.handleUpvoteSubmit}>
        <button className="button" type="submit"> ʌ </button>
      </form>
    );
  }
 }

 export default Upvote;
