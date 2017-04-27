import React from 'react';
import { browserHistory, Link } from 'react-router';

const ReviewShow = (props) => {
 const { title, description, rating } = props
 return(
   <div className="review-show">
     <p className="review-title">{title}</p>
     <p className="review-description">{description}</p>
     <p className="review-rating">{rating} stars</p>
   </div>
)}

export default ReviewShow;
