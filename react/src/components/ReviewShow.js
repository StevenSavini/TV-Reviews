import React, {Component} from 'react';
import { browserHistory, Link } from 'react-router';
import Upvote from './Upvote';
import Downvote from './Downvote';

class ReviewShow extends Component {
  constructor(props) {
    super(props);
    this.state = {
      total_votes: this.props.total_votes
    }

    this.handleUpvoteClick = this.handleUpvoteClick.bind(this);
    this.handleDownVoteClick = this.handleDownVoteClick.bind(this);
  }

  handleUpvoteClick(payload){
    fetch(`/api/v1/reviews/${this.props.id}?vote=up`, {
      credentials: 'same-origin',
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: payload
    })
    .then(response => response.json())
    .then(responseData => {
      console.log(responseData)
      this.setState({ total_votes: responseData.review.total_votes })
    })
  }

  handleDownVoteClick(payload){
    fetch(`/api/v1/reviews/${this.props.id}?vote=down`, {
      credentials: 'same-origin',
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: payload
    })
    .then(response => response.json())
    .then(responseData => {
      console.log(responseData)
      this.setState({ total_votes: responseData.review.total_votes })
    })
  }

  render() {
    let editLink = `/shows/${this.props.showId}/reviews/${this.props.id}/edit`;
    return(
      <div className="media-object">
        <div className="media-object-section">
          <Upvote review={this.props.review} handleClick={this.handleUpvoteClick}/>
          <Downvote review={this.props.review} handleClick={this.handleDownVoteClick}/>
        </div>
        <div className="media-object-section">
          <p className="votes">{this.state.total_votes}</p>
        </div>
        <div className="media-object-section">
          <p className="review-title">Title: {this.props.title}</p>
          <p className="review-description">Description: {this.props.description}</p>
          <p className="review-rating">Rating: {this.props.rating}</p>
          <a href={editLink}> Edit </a>
        </div>
      </div>
    )
  }
}

export default ReviewShow;
