import React, { Component } from 'react';
import ReviewShow from '../components/ReviewShow';

class ReviewsContainer extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    let reviews = this.props.reviews.map(review => {
      return(
        <ReviewShow
          review={review}
          id={review.id}
          title={review.title}
          description={review.description}
          key={"review" + review.id}
          rating={review.rating}
          total_votes={review.total_votes}
          showId={this.props.showId}
         />
      )
    })
    return(
      <div>
        <h2>Current Reviews</h2>
        {reviews.reverse()}
      </div>
    )
  }
}

export default ReviewsContainer;
