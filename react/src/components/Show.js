import React from 'react';

class Show extends React.Component {
    constructor(props) {
    super(props);
  }
  render() {
    return(
      <div>
        <h1>{this.props.show}</h1>
      </div>
    );
  }
};

export default Show;
