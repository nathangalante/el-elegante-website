// import { BrowserRouter, Route } from "react-router-dom";
import { Component } from "react";
import AllSets from "./allSets";
import Set from "./set";
import SearchBar from "./searchBar";

export default class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            sets: [],
            selectedSet: {},
        };
        this.updateSelectedState = this.updateSelectedState.bind(this);
        this.updateSets = this.updateSets.bind(this);
    }
    componentDidMount() {
        // console.log("component did mount", this.state);
        fetch("/image")
            .then((res) => res.json())
            .then(({ rows }) => {
                // console.log("data on image", rows);
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

    updateSets(newSet) {
        this.setState({
            sets: newSet,
        });
    }
    render() {
        console.log("state on render app", this.state);
        return (
            <>
                <h1>El Elegante Podcast</h1>
                <SearchBar
                    sets={this.state.sets}
                    updateSelectedState={this.updateSelectedState}
                    updateSets={this.updateSets}
                />
                <Set url={this.state.selectedSet?.url} />
                <AllSets
                    sets={this.state.sets}
                    updateSelectedState={this.updateSelectedState}
                />
            </>
        );
    }
}
