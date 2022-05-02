// import InfiniteScroll from "react-infinite-scroll-component";

export default function AllSets(props) {
    console.log("test", props.sets);
    return (
        <>
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
                        console.log("splittedgenres------->", splittedGenres);
                        console.log("set------->", set);
                        return (
                            <div key={set.id} className="setHome">
                                <div
                                    onClick={() =>
                                        props.updateSelectedSet(set.id)
                                    }
                                >
                                    <p>{set.name}</p>
                                    <img
                                        src={"/rosa7.png"}
                                        className="setCover"
                                    />
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
                {!props.searchTerm && (
                    <button onClick={props.getMoreSets}>More</button>
                )}
            </div>
        </>
    );
}
