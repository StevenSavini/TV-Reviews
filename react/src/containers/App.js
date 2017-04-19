import React, { Component } from 'react'

import Show from '../components/Show'


class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      shows
    }
  }

  render() {
    return(
      <div>
        <div className="row">
          <div className="small-12 columns">
            <h1>Must Watch TV Shows</h1>
            {showComponents}
          </div>
        </div>
      </div>
    )
  }
}

export default App
