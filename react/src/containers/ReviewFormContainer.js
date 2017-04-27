import React, { Component } from 'react';
import Select from '../components/Select';
import DescriptionField from '../components/DescriptionField';
import TitleField from '../components/TitleField';
class ReviewFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      reviewTitle: '',
      reviewDescription: '',
      ratingOptions: [1,2,3,4,5],
      ratingSelected: 1

    }
    this.reviewTitleHandle=this.reviewTitleHandle.bind(this);
    this.reviewSelectHandle=this.reviewSelectHandle.bind(this);
    this.reviewDescriptionHandle=this.reviewDescriptionHandle.bind(this);
    this.handleClearForm=this.handleClearForm.bind(this);
    this.handleFormSubmit=this.handleFormSubmit.bind(this);
  }
  reviewTitleHandle(event) {
    event.preventDefault();
    this.setState({ reviewTitle: event.target.value })
  }

  reviewDescriptionHandle(event) {
    event.preventDefault();
    this.setState({ reviewDescription: event.target.value })
  }

  reviewSelectHandle(event) {
    event.preventDefault();
    this.setState({ ratingSelected: event.target.value })
  }

  handleClearForm(event) {
    event.preventDefault();
    this.setState({
      reviewTitle: '',
      ratingSelected: 1,
      reviewDescription: ''
    })
  }

  handleFormSubmit(event) {
    event.preventDefault()
    let protoPayload = {
      title: this.state.reviewTitle,
      description: this.state.reviewDescription,
      rating: this.state.ratingSelected,
      show_id: this.props.showId
    };
    let formPayload = JSON.stringify(protoPayload);
    this.props.addNewReview(formPayload);
    this.handleClearForm(event);
  }

  render() {

    return(
      <form className="new-review-form callout" onSubmit={this.handleFormSubmit}>
        <TitleField
          content={this.state.reviewTitle}
          label="Review Title"
          name="review-title"
          changeHandle={this.reviewTitleHandle}
        />
      <DescriptionField
          content={this.state.reviewDescription}
          label="Review"
          name="review-description"
          changeHandle={this.reviewDescriptionHandle}
        />
        <Select
          changeHandle={this.reviewSelectHandle}
          name='rating'
          label='Rating'
          options={this.state.ratingOptions}
          selectedOption={this.state.ratingSelected}
        />

        <div className="button-group">
          <button className="button" onClick={this.handleClearForm}>Clear</button>
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
    )
  }
}

export default ReviewFormContainer;
