import { useEffect, useState } from "react";
import { Link } from "react-router-dom";

export default function Moods() {
    const [moods, setMoods] = useState([]);

    function getMoods() {
        fetch("/moods")
            .then((res) => res.json())
            .then((moods) => {
                console.log("moods----->", moods.rows);
                setMoods(moods.rows);
            })
            .catch((err) => {
                console.log(err);
            });
    }

    useEffect(() => {
        getMoods();
    }, []);

    return (
        <>
            <p className="fontMoods">Get In the Mood With These Moods</p>
            <div className="moods">
                {moods &&
                    moods.map((mood) => {
                        console.log("this is Mooooooood!!!", mood);
                        return (
                            <Link to={`/pick-moods/${mood.id}`} key={mood.id}>
                                <div className="setMood">
                                    <p className="textArea">{mood.name}</p>
                                </div>
                            </Link>
                        );
                    })}
            </div>
        </>
    );
}
