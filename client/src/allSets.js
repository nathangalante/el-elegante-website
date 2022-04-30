export default function AllSets(props) {
    return (
        <>
            <div className="setsHome">
                {props.sets &&
                    props.sets.map((set) => (
                        <div key={set.id}>
                            <div
                                className="setHome"
                                onClick={() =>
                                    props.updateSelectedState(set.id)
                                }
                            >
                                <p>{set.name}</p>
                                <img src={"/rosa7.png"} className="setCover" />
                                <div className="tags">
                                    <p className="genreBox">Disco</p>
                                    <p className="genreBox">House</p>
                                    <p className="genreBox">Techno</p>
                                </div>
                            </div>
                        </div>
                    ))}
            </div>
        </>
    );
}
