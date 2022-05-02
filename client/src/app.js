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
            genre: [],
        };
        this.updateSelectedState = this.updateSelectedState.bind(this);
        this.updateSets = this.updateSets.bind(this);
        this.getMoreSets = this.getMoreSets.bind(this);
        this.renderNewSets = this.renderNewSets.bind(this);
    }

    componentDidMount() {
        // console.log("component did mount", this.state);
        fetch("/sets")
            .then((res) => res.json())
            .then(({ rows }) => {
                console.log("data on sets", rows);
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

    renderNewSets(newSets) {
        this.setState({
            sets: [...this.sets, newSets].flat(),
        });
    }

    updateSets(newSet) {
        this.setState({
            sets: newSet,
        });
    }

    getMoreSets() {
        console.log("this state get more sets: ", this.state.sets);
        const lastId = this.state.sets[this.state.sets.length - 1].id;
        console.log("state on getMoreSets", lastId);
        fetch(`/moreSets/${lastId}`)
            .then((res) => res.json())
            .then((moreSets) => {
                let nextBatch = moreSets.rows;
                console.log("nextBatch", nextBatch);
                console.log("moreSets----", moreSets);
                this.setState({ sets: [...this.state.sets, nextBatch].flat() });
                console.log("this sets on getMoreSets*****", this.state.sets);
            })
            .catch((err) => {
                console.log(err);
            });
    }

    render() {
        return (
            <>
                <h1>El Elegante Podcast</h1>
                <BrowserRouter>
                    <Route exact path="/moods">
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
                <AllSets
                    sets={this.state.sets}
                    updateSelectedState={this.updateSelectedState}
                    getMoreSets={this.getMoreSets}
                    genre={this.state.genre}
                />
            </>
        );
    }
}
