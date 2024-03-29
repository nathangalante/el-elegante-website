// import InfiniteScroll from "react-infinite-scroll-component";

export default function AllSets(props) {
    console.log("props on AllSets!!: ", props);
    return (
        <>
            {props.genre && (
                <div className="overGenre">
                    <p className="genre">{props.genre}</p>
                </div>
            )}
            <div className="setsHome">
                {props.sets &&
                    props.sets.map((set) => {
                        // console.log({ set });
                        const splittedGenres =
                            set.genre &&
                            set.genre
                                .replaceAll("{", "")
                                .replaceAll("}", "")
                                .split(",");
                        return (
                            <div key={set.id} className="setHome">
                                <div
                                    onClick={() =>
                                        props.updateSelectedSet(set.id)
                                    }
                                >
                                    <div className="titleContainer">
                                        <p className="setTitle">{set.name}</p>
                                    </div>
                                    <img src={set.image} className="setCover" />
                                </div>
                                <div className="tags">
                                    {splittedGenres &&
                                        splittedGenres.map((genre) => (
                                            <button
                                                className="genreBox"
                                                key={genre}
                                                onClick={() =>
                                                    props.setsByGenre(genre)
                                                }
                                            >
                                                {genre}
                                            </button>
                                        ))}
                                </div>
                            </div>
                        );
                    })}
            </div>
            <div className="buttonMiddle">
                {!props.searchTerm &&
                    props.sets[props.sets.length - 1]?.id != 62 &&
                    props.sets.length >= 5 && (
                        <button onClick={props.getMoreSets}>More</button>
                    )}
            </div>
        </>
    );
}
