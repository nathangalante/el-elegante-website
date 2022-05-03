import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

export default function MoodSets(props) {
    const [moodSets, setMoodSets] = useState([]);
    const [moodName, setMoodName] = useState("");

    let { id } = useParams();

    function getMoodSets() {
        fetch(`/mood-sets/${id}`)
            .then((res) => res.json())
            .then((moodSets) => {
                console.log("moods----====->", moodSets.rows[0].name);
                setMoodSets(moodSets.rows);
                setMoodName(moodSets.rows[0].name);
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
            <div className="setsHome">
                {moodSets &&
                    moodSets.map((moodSet) => {
                        // console.log({ set });
                        const splittedGenres =
                            moodSet.genre &&
                            moodSet.genre
                                .replaceAll("{", "")
                                .replaceAll("}", "")
                                .split(",");
                        console.log("splittedgenres------->", splittedGenres);
                        // console.log("moodSet------->", moodSet);
                        return (
                            <div key={moodSet.id} className="setHome">
                                <div
                                    onClick={() => {
                                        console.log("Moooooood", { moodSet });
                                        props.updateSelectedSetInMoods(
                                            moodSet.id,
                                            moodSets,
                                            moodSet.name
                                        );
                                    }}
                                >
                                    <p>{moodSet.name}</p>
                                    <img
                                        src={"/rosa7.png"}
                                        className="setCover"
                                    />
                                </div>
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
