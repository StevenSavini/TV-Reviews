import React, { Component } from 'react';
import ReviewShow from '../components/ReviewShow';
import ReviewFormContainer from './ReviewFormContainer';

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
    console.log(responseData)
    this.setState({ reviews: [...this.state.reviews, responseData.review] })
  })
}

  render() {
    let reviews = this.state.reviews.map(review => {
      return(
        <ReviewShow
          id={review.id}
          title={review.title}
          description={review.description}
          key={"review" + review.id}
          rating={review.rating}
         />
      )
    })
    return(
      <div className="small-9 small-centered columns">
        <ReviewFormContainer
          addNewReview={this.addNewReview}
          showId={this.props.params.id}
          />
        {reviews.reverse()}
      </div>
    )
  }
}

export default ReviewShowContainer;
