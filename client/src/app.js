// import { BrowserRouter, Route } from "react-router-dom";
import { Component } from "react";
import AllSets from "./allSets";
import Set from "./set";
import SearchBar from "./searchBar";
import { BrowserRouter, Route } from "react-router-dom";
import Moods from "./moods";
import MoodSets from "./moodSets";
import { Link } from "react-router-dom";

export default class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            sets: [],
            selectedSet: {},
            genre: "",
            searchTerm: "",
            moods: [],
        };
        this.updateSelectedSet = this.updateSelectedSet.bind(this);
        this.updateSets = this.updateSets.bind(this);
        this.getMoreSets = this.getMoreSets.bind(this);
        this.renderNewSets = this.renderNewSets.bind(this);
        this.setsByGenre = this.setsByGenre.bind(this);
        this.setSearchTerm = this.setSearchTerm.bind(this);
        this.updateSelectedSetInMoods =
            this.updateSelectedSetInMoods.bind(this);
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

    updateSelectedSet(id) {
        this.setState({
            selectedSet: this.state.sets.find((set) => {
                return set.id === id;
            }),
        });
    }

    updateSelectedSetInMoods(id, moodsSets) {
        this.setState({
            selectedSet: moodsSets.find((set) => {
                return set.id === id;
            }),
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
        // console.log("this state get more sets: ", this.state.sets);
        const lastId = this.state.sets[this.state.sets.length - 1].id;
        // console.log("state on getMoreSets", lastId);
        fetch(`/moreSets/${lastId}?searchQuery=${this.state.searchTerm}`)
            .then((res) => res.json())
            .then((moreSets) => {
                let nextBatch = moreSets.rows;
                // console.log("nextBatch", nextBatch);
                // console.log("moreSets----", moreSets);
                this.setState({ sets: [...this.state.sets, nextBatch].flat() });
                // console.log("this sets on getMoreSets*****", this.state.sets);
            })
            .catch((err) => {
                console.log(err);
            });
    }

    setsByGenre(filteredGenre) {
        this.setState({ genre: filteredGenre });
    }

    setSearchTerm(searchTerm) {
        this.setState({ searchTerm: searchTerm });
    }

    render() {
        const setsFilteredByGenre =
            this.state.sets &&
            this.state.sets.filter((set) => {
                if (this.state.genre.length === 0) {
                    return true;
                }
                const setGenres = set.genre;
                if (setGenres.includes(this.state.genre)) {
                    return true;
                } else {
                    return false;
                }
                // return setGenres.includes(this.state.genre);
            });
        return (
            <>
                <h1>El Elegante Podcast</h1>
                <BrowserRouter>
                    <Route exact path="/pick-moods">
                        <Moods moods={this.state.moods} />
                    </Route>
                    <Route exact path="/pick-moods/:id">
                        <MoodSets
                            updateSelectedSetInMoods={
                                this.updateSelectedSetInMoods
                            }
                            updateSelectedSet={this.updateSelectedSet}
                        />
                    </Route>
                    <Route exact path="/">
                        <Link to="/pick-moods">Moods</Link>
                        <SearchBar
                            updateSets={this.updateSets}
                            searchTerm={this.state.searchTerm}
                            setSearchTerm={this.setSearchTerm}
                        />
                        <AllSets
                            sets={setsFilteredByGenre}
                            updateSelectedSet={this.updateSelectedSet}
                            getMoreSets={this.getMoreSets}
                            setsByGenre={this.setsByGenre}
                            searchTerm={this.state.searchTerm}
                        />
                    </Route>
                </BrowserRouter>
                <Set url={this.state.selectedSet?.url} />
            </>
        );
    }
}
