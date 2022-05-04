import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

export default function MoodSets(props) {
    const [moodSets, setMoodSets] = useState([]);
    const [moodName, setMoodName] = useState("");
    console.log("props on MoodSets", props);

    let { id } = useParams();

    function getMoodSets() {
        fetch(`/mood-sets/${id}`)
            .then((res) => res.json())
            .then((moodSets) => {
                console.log("moods----====->", moodSets);
                setMoodSets(moodSets);
                setMoodName(moodSets[0].mood);
            })
            .catch((err) => {
                console.log(err);
            });
    }

    useEffect(() => {
        getMoodSets();
    }, []);

    return (
        <>
            {moodName && <p className="moodBar">{moodName}</p>}
            <div className="setsHomeMoods">
                {moodSets &&
                    moodSets.map((moodSet) => {
                        // console.log({ set });
                        const splittedGenres =
                            moodSet.genre &&
                            moodSet.genre
                                .replaceAll("{", "")
                                .replaceAll("}", "")
                                .split(",");
                        return (
                            <div key={moodSet.id} className="setHome">
                                <div
                                    onClick={() => {
                                        console.log("Moooooood", { moodSet });
                                        props.updateSelectedSetInMoods(
                                            moodSet.id,
                                            moodSets,
                                            moodSet.name,
                                            moodSet.image
                                        );
                                    }}
                                >
                                    <p>{moodSet.name}</p>
                                    <img
                                        src={moodSet.image}
                                        className="setCoverMoods"
                                    />
                                </div>
                                {/* <div className="buttonMiddle">
                                    {!props.searchTerm &&
                                        props.sets[props.sets.length - 1]?.id !=
                                            62 &&
                                        props.sets.length >= 5 && (
                                            <button onClick={props.getMoreSets}>
                                                More
                                            </button>
                                        )}
                                </div> */}
                                {/* <div className="tags">
                                    {splittedGenres &&
                                        splittedGenres.map((genre) => (
                                            <p className="genreBox" key={genre}>
                                                {genre}
                                            </p>
                                        ))}
                                </div> */}
                            </div>
                        );
                    })}
            </div>
        </>
    );
}
