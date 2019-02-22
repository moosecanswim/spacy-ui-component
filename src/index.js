import React from 'react';
import _ from 'lodash';

function pruneEmpty(obj) {
  return (function prune(current) {
    _.forOwn(current, (value, key) => {
      if (
        _.isUndefined(value) ||
        _.isNull(value) ||
        _.isNaN(value) ||
        (_.isString(value) && _.isEmpty(value)) ||
        (_.isObject(value) && _.isEmpty(prune(value)))
      ) {
        delete current[key];
      }
    });
    // remove any leftover undefined values from the delete
    // operation on an array
    if (_.isArray(current)) _.pull(current, undefined);

    return current;
  })(_.cloneDeep(obj)); // Do not modify the original object, create a clone instead
}

function analyze(url, text, Component) {
  return class extends React.Component {
    state = { data: null };

    componentDidMount() {
      fetch(url, {
        method: 'POST',
        mode: 'cors', // no-cors, cors, *same-origin
        credentials: 'same-origin', // include, *same-origin, omit
        headers: { 'Content-Type': 'application/json' },
        redirect: 'follow',
        referrer: 'no-referrer',
        body: JSON.stringify({ document: text })
      })
        .then(res => res.json())
        .then(data => pruneEmpty(data))
        .then(data => this.setState({ data }))
        .catch(err =>
          console.error(`Error occurred during request to ${url}`, err)
        );
    }

    render() {
      return <Component data={this.state.data} />;
    }
  };
}

export default analyze;
