import React, { Component } from 'react';
import ReviewShow from '../components/ReviewShow';
import ReviewFormContainer from './ReviewFormContainer';
import ReviewsContainer from './ReviewsContainer';

class ReviewShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: [],
    }
    this.addNewReview = this.addNewReview.bind(this)
  }

  componentDidMount() {
    let showId = this.props.params.id;
    fetch(`/api/v1/shows/${showId}`)
      .then(response => response.json())
      .then(responseData => {
        this.setState({
          reviews: [...this.state.reviews, ...responseData.reviews]
        })
      })
  }

  addNewReview(review) {
    fetch('/api/v1/reviews.json', {
      credentials: 'same-origin',
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: review
    })
    .then(response => response.json())
  .then(responseData => {
    this.setState({ reviews: [...this.state.reviews, responseData.review] })
  })
}

  render() {
    return(
      <div className="row">
        <div className="small-6 columns">
          <h2>Submit a Review</h2>
          <ReviewFormContainer
            addNewReview={this.addNewReview}
            showId={this.props.params.id}
            />
        </div>
        <div className="small-6 columns">
          <ReviewsContainer
            reviews={this.state.reviews}
            showId={this.props.params.id}
          />
        </div>
      </div>
    )
  }
}

export default ReviewShowContainer;
