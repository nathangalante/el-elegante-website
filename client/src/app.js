// import { BrowserRouter, Route } from "react-router-dom";
import { Component } from "react";
import AllSets from "./allSets";
import Set from "./set";

export default class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            sets: [],
            selectedSet: {},
        };
        this.updateSelectedState = this.updateSelectedState.bind(this);
    }
    componentDidMount() {
        console.log("component did mount", this.state);
        fetch("/image")
            .then((res) => res.json())
            .then(({ rows }) => {
                console.log("data on image", rows);
                this.setState({ sets: rows }, () =>
                    this.setState({
                        selectedSet: this.state.sets[0],
                    })
                );
            })
            .catch((err) => {
                console.log("error", err);
            });
    }

    updateSelectedState(id) {
        this.setState({
            selectedSet: this.state.sets.at(id - 1),
        });
    }

    render() {
        return (
            <>
                <h1>El Elegante Podcast</h1>
                <Set url={this.state.selectedSet.url} />
                <AllSets
                    sets={this.state.sets}
                    updateSelectedState={this.updateSelectedState}
                />
            </>
        );
    }
}
