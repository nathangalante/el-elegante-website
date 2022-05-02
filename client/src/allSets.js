// import InfiniteScroll from "react-infinite-scroll-component";

export default function AllSets(props) {
    return (
        <>
            <div className="setsHome">
                {props.sets &&
                    props.sets.map((set) => (
                        <div
                            key={set.id}
                            className="setHome"
                            onClick={() => props.updateSelectedState(set.id)}
                        >
                            <p>{set.name}</p>
                            <img src={"/rosa7.png"} className="setCover" />
                            <div className="tags">
                                <p className="genreBox">{props.genre}</p>
                                <p className="genreBox">{props.genre}</p>
                                <p className="genreBox">{props.genre}</p>
                            </div>
                        </div>
                    ))}
                <button onClick={props.getMoreSets}>More</button>
            </div>
        </>
    );
}
