// import { BrowserRouter, Route } from "react-router-dom";
import { Component } from "react";
import AllSets from "./allSets";
import Set from "./set";
import SearchBar from "./searchBar";
import { BrowserRouter, Route } from "react-router-dom";
import Moods from "./moods";
import { Link } from "react-router-dom";

export default class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            sets: [],
            selectedSet: {},
            moreButton: true,
            lowestId: null,
        };
        this.updateSelectedState = this.updateSelectedState.bind(this);
        this.updateSets = this.updateSets.bind(this);
        this.getMoreSets = this.getMoreSets.bind(this);
    }
    componentDidMount() {
        // console.log("component did mount", this.state);
        fetch("/sets")
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

    getMoreSets() {
        this.id = this.sets[this.state.sets.length].id + 6;
        console.log("this state get more sets: ", this.state.sets.length);
        console.log("state on getMoreSets", this.state);
        console.log("lowestID: ", this.state.lowestId);
        fetch(`/sets/${this.id}`)
            .then((res) => res.json())
            .then((data) => {
                console.log("rows-->", data);
                for (let i = 0; i < data.length; i++) {
                    this.state.sets.push(data[i]);
                }
            })
            .catch((err) => {
                console.log(err);
            });
    }

    render() {
        return (
            <>
                <h1>El Elegante Podcast</h1>
                <h1> Hier is Radio</h1>
                <BrowserRouter>
                    <Route exact path="/find-users">
                        <Moods />
                    </Route>
                    <Link to="/moods">Moods</Link>
                </BrowserRouter>
                <SearchBar
                    sets={this.state.sets}
                    updateSelectedState={this.updateSelectedState}
                    updateSets={this.updateSets}
                />
                <Set url={this.state.selectedSet?.url} />
                <button onClick={this.getMoreSets}>More</button>
                <AllSets
                    sets={this.state.sets}
                    updateSelectedState={this.updateSelectedState}
                />
            </>
        );
    }
}
