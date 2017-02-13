import React, { Component } from 'react';
import Review from './Review';

class Reviews extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    };
  }

  componentDidMount() {
    fetch(`/api/v1/eyeshadows/${this.props.id}/reviews.json`)
      .then(response => {
        if (response.ok) {
          return response;
        }
      })
      .then(response => response.json())
      .then(data => {
        this.setState({ reviews: data });
      });
  }

  render() {
      let reviews = this.state.reviews.map((review, idx) => {
        return (
          <Review
            key={idx}
            eyeshadow={this.props.id}
            review={review}
            users={this.props.users}
            user={this.props.user}
              />
        );
      });

    return (
      <ul>{reviews}</ul>
    );
  }
}

export default Reviews;
