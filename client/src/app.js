// import { BrowserRouter, Route } from "react-router-dom";
import { Component } from "react";
import AllSets from "./allSets";
import Set from "./set";
import SearchBar from "./searchBar";
import { BrowserRouter, Route } from "react-router-dom";
import Moods from "./moods";
import MoodSets from "./moodSets";
import { Link } from "react-router-dom";
import { useHistory } from "react-router";

export default class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            sets: [],
            selectedSet: {},
            genre: "",
            searchTerm: "",
            moods: [],
            image: "",
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

    updateSelectedSetInMoods(id, moodsSets, moodSetName) {
        console.log("moodSetName====>:", moodSetName);
        this.setState({
            selectedSet: moodsSets.find((set) => {
                return set.id === id;
            }),
            moodSetName,
        });
    }

    renderNewSets(newSets) {
        this.setState({
            sets: [...this.sets, newSets].flat(),
        });
    }

    updateSets(newSet) {
        console.log("NEWset", newSet);
        this.setState({
            sets: newSet,
        });
    }

    getMoreSets() {
        const lastId = this.state.sets[this.state.sets.length - 1].id;
        fetch(`/moreSets/${lastId}?searchQuery=${this.state.searchTerm}`)
            .then((res) => res.json())
            .then((moreSets) => {
                let nextBatch = moreSets.rows;
                this.setState({ sets: [...this.state.sets, nextBatch].flat() });
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
    mouseClickEvents() {
        const mouseClickEvents = ["mousedown", "click", "mouseup"];
        function simulateMouseClick(element) {
            mouseClickEvents.forEach((mouseEventType) =>
                element.dispatchEvent(
                    new MouseEvent(mouseEventType, {
                        view: window,
                        bubbles: true,
                        cancelable: true,
                        buttons: 1,
                    })
                )
            );
        }

        var element = document.querySelector('div[class="UFIInputContainer"]');
        simulateMouseClick(element);
    }

    render() {
        console.log("this state on filtered by genre: ", this.state.sets);
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
                <BrowserRouter>
                    {history.reload && (
                        <Link to="/">
                            <img src="/elegante2.jpg" className="photo"></img>
                        </Link>
                    )}
                    <Route exact path="/">
                        <div className="topBar">
                            <SearchBar
                                updateSets={this.updateSets}
                                searchTerm={this.state.searchTerm}
                                setSearchTerm={this.setSearchTerm}
                            />
                            {/* <Link to="/"> */}
                            <img src="/logo9.jpg" className="titlePhoto" />
                            {/* </Link> */}
                            {/* <div className="title">
                                <h1>El Elegante Podcast</h1>
                            </div> */}

                            <div className="moodLink">
                                <Link to="/pick-moods">Moods</Link>
                            </div>
                        </div>
                        <AllSets
                            sets={setsFilteredByGenre}
                            updateSelectedSet={this.updateSelectedSet}
                            getMoreSets={this.getMoreSets}
                            setsByGenre={this.setsByGenre}
                            searchTerm={this.state.searchTerm}
                            genre={this.state.genre}
                            image={this.state.sets.image}
                        />
                    </Route>
                    <Route exact path="/pick-moods">
                        <p>{this.state.moodSetName}</p>
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
                </BrowserRouter>
                <Set url={this.state.selectedSet?.url} />
            </>
        );
    }
}
